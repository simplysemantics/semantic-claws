# SemanticClaws

**Trusted, hardened local-first AI gateway component for US & North America**  
Built by **[Simply Semantics](https://www.simplysemantics.com)** — delivering simple AI solutions to grow your business.

SemanticClaws provides a secure, privacy-focused, rootless Podman container that runs a local AI assistant gateway entirely on-device — **no telemetry**, no cloud dependencies, minimal footprint. Ideal as a small, low-cost SaaS building block for company products, AI agents, bots, and business workflows.

**This project is a US/North America-optimized fork/setup** leveraging the excellent open-source **OpenClaw** project. We extend it with enhanced security, rootless Podman defaults, stricter permissions, vulnerability scanning hooks, and trust-focused documentation to better suit privacy-conscious businesses and users in the US and Canada (e.g., aiding CCPA compliance, data residency, and supply-chain verifiability).

**Huge thanks to the OpenClaw team** for creating an amazing, platform-agnostic personal AI assistant foundation — the "lobster way" 🦞. SemanticClaws stands on their shoulders and adds hardening for higher trust in regulated or enterprise-adjacent environments.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Podman Compatible](https://img.shields.io/badge/Podman-Compatible-success)](https://podman.io)

## Why SemanticClaws? Local-First Security & Privacy

**Key trust features for US & North American users/businesses:**

- **Local-first & on-device** — All AI processing and data stay on your machine/server. **No telemetry**, no cloud uploads.
- **Rootless Podman** by default — No root privileges needed, reducing attack surface dramatically.
- **Secure defaults** — Random gateway token, strict file permissions (600/700), audit logging.
- **Privacy-friendly** — Helps meet CCPA, state privacy laws, and enterprise data residency needs.
- **One-command install** — Download script → inspect → run (no repo clone required).
- **Open & verifiable** — Signed releases, transparent upstream sourcing, SECURITY.md policy.

Perfect as a lightweight, high-volume component: low cost per install, easy to embed in products/bots, scalable across thousands of deployments.

**Credit & Upstream**  
SemanticClaws builds directly on the fantastic **OpenClaw** open-source project:  
- Original repo: https://github.com/openclaw/openclaw  
- Website & Docs: https://openclaw.ai / https://docs.openclaw.ai  
We deeply appreciate their work on a flexible, personal AI assistant gateway — we’ve simply tailored the setup script for stronger security and trust in North American contexts.

