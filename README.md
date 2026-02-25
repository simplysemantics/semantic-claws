# SemanticClaws

**Trusted, hardened local-first AI gateway component for US & North America**  
Built by **[Simply Semantics](https://www.simplysemantics.com)** — delivering simple AI solutions to grow your business.

SemanticClaws is a lightweight, secure, Podman/Docker-compatible container that provides a privacy-focused gateway for local AI tooling and assistants. It runs **entirely on-device** with **no telemetry**, no cloud dependencies, and a minimal footprint — ideal as a small, low-cost SaaS building block for company products, AI agents, bots, and business workflows.

**This project is a US/North America-optimized fork/setup** leveraging the excellent open-source **OpenClaw** project[](https://github.com/openclaw/openclaw). We extend it with enhanced security, rootless Podman defaults, stricter permissions, vulnerability scanning hooks, and trust-focused documentation to better suit privacy-conscious businesses and users in the US and Canada (e.g., aiding CCPA compliance, data residency, and supply-chain verifiability).

**Huge thanks to the OpenClaw team** for creating an amazing, platform-agnostic personal AI assistant foundation — the "lobster way" 🦞. SemanticClaws stands on their shoulders and adds hardening for higher trust in regulated or enterprise-adjacent environments.

[![GitHub](https://img.shields.io/badge/GitHub-semantic--claws-blue?logo=github)](https://github.com/[your-username]/semantic-claws)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Podman Compatible](https://img.shields.io/badge/Podman-Compatible-success)](https://podman.io)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=[your-username]/semantic-claws)](https://dependabot.com)

## Why SemanticClaws? Local-First Security & Privacy

Built by **Simply Semantics** (www.simplysemantics.com) — creators of simple, actionable AI solutions for small & mid-size businesses.

**Key trust features for US & North American users/businesses:**

- **Local-first & on-device** — All AI processing and data stay on your machine/server. **No telemetry**, no cloud uploads.
- **Rootless Podman** by default — No root privileges needed, reducing attack surface dramatically.
- **Non-root container** — Runs as unprivileged `openclaw` user.
- **Minimal & auditable** — Slim Node.js base, vulnerability scanning hooks (Trivy), strict permissions.
- **Privacy-friendly** — Helps meet CCPA, state privacy laws, and enterprise data residency needs.
- **Open source & verifiable** — Signed releases, Dependabot alerts, SECURITY.md policy.

Perfect as a lightweight, high-volume component: low cost per install, easy to embed in products/bots, scalable across thousands of deployments.

**Credit & Upstream**  
SemanticClaws builds directly on the fantastic **OpenClaw** open-source project:  
- Original repo: https://github.com/openclaw/openclaw  
- Website & Docs: https://openclaw.ai / https://docs.openclaw.ai  
- We deeply appreciate their work on a flexible, personal AI assistant gateway — we’ve simply tailored the setup script, Dockerfile, and docs for stronger security and trust in North American contexts.

## Features

- Secure rootless Podman setup (~2-minute install)
- Non-root runtime with isolated namespaces (subuid/subgid)
- Automatic secure token generation
- Optional Trivy vulnerability scanning during build
- Systemd quadlet support for reliable auto-start
- Healthchecks & minimal exposed ports
- Fully local — ideal for privacy-sensitive workflows, AI agents, lead generation bots, semantic tools, etc.

## Quick Start

**Best practice (recommended for production/security):**  
Clone the repo (or download files individually), then:

```bash
# Option A: Clone the full repo (recommended — includes Dockerfile)
git clone https://github.com/simplysemantics/semantic-claws.git
cd semantic-claws

# Option B: Download script only (still needs Dockerfile in same dir)
curl -sSL -o setup-semanticclaws.sh https://github.com/simplysemantics/semantic-claws/main/setup-semanticclaws.sh
# Also download Dockerfile if using this method:
curl -sSL -o Dockerfile https://github.com/simplysemantics/semantic-claws/main/Dockerfile

# 1. Inspect (very important!)
cat setup-semanticclaws.sh   # or open in editor
cat Dockerfile               # review build layers & security

# 2. Make executable & run
chmod +x setup-semanticclaws.sh
./setup-semanticclaws.sh