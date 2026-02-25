# syntax=docker/dockerfile:1

# ────────────────────────────────────────────────────────────────
# Stage 1: Builder (install deps, build app)
# ────────────────────────────────────────────────────────────────
FROM node:22-bookworm-slim AS builder

# Install build dependencies (minimal set)
RUN apt-get update --quiet=2 && \
    apt-get install --no-install-recommends -y \
      ca-certificates curl git python3 build-essential && \
    rm -rf /var/lib/apt/lists/*

# Use Bun for faster install (OpenClaw standard)
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

WORKDIR /app

# Copy package files first → cache layer
COPY package.json bun.lockb* ./

# Install production + dev deps (for build)
RUN bun install --frozen-lockfile

# Copy source and build
COPY . .
RUN bun run build

# ────────────────────────────────────────────────────────────────
# Stage 2: Runtime (slim final image)
# ────────────────────────────────────────────────────────────────
FROM node:22-bookworm-slim

# Labels for trust & discoverability (GitHub/Container Registry)
LABEL org.opencontainers.image.title="SemanticClaws Gateway" \
      org.opencontainers.image.description="Trusted local AI gateway component by Simply Semantics" \
      org.opencontainers.image.source="https://github.com/[your-org]/semanticclaws" \
      org.opencontainers.image.vendor="Simply Semantics" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.version="1.0.0" \
      maintainer="Simply Semantics <support@simplysemantics.com>"

# Install runtime essentials (Chromium + deps for Playwright/browser skills)
RUN apt-get update --quiet=2 && \
    apt-get install --no-install-recommends -y \
      ca-certificates dumb-init tini curl jq && \
    # Playwright deps (headless Chromium, fonts, etc.)
    apt-get install --no-install-recommends -y \
      libnss3 libatk-bridge2.0-0 libdrm2 libxkbcommon0 libgbm1 libasound2 fonts-liberation && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -r -s /bin/false -u 10001 openclaw

WORKDIR /app
RUN chown -R openclaw:openclaw /app

# Copy built artifacts from builder
COPY --from=builder --chown=openclaw:openclaw /app/dist ./dist
COPY --from=builder --chown=openclaw:openclaw /app/node_modules ./node_modules
COPY --from=builder --chown=openclaw:openclaw /app/package.json ./

# Optional: Pre-install Playwright browsers (caches ~300-500MB but avoids runtime downloads)
ENV PLAYWRIGHT_BROWSERS_PATH=0
RUN su -s /bin/bash openclaw -c "npx playwright install --with-deps chromium"

# Volumes for persistence (config, memory, workspaces)
VOLUME ["/data"]

# Environment defaults (override via .env or podman run -e)
ENV NODE_ENV=production \
    OPENCLAW_HOME=/data \
    PORT=8080

# Healthcheck (optional but builds trust)
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:${PORT}/health || exit 1

# Run as non-root
USER openclaw

# Use tini or dumb-init for proper signal handling
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "dist/index.js"]