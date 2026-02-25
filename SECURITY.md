# Security Policy

Thank you for helping keep **SemanticClaws** (by Simply Semantics) secure.

SemanticClaws is a small, local-first AI gateway component designed for privacy-focused deployments. All processing happens on-device with no telemetry or external calls by default.

## Supported Versions

We actively support the latest release and the previous minor version. Security fixes are backported where feasible.

| Version | Supported          |
| ------- | ------------------ |
| latest  | :white_check_mark: |
| v1.x    | :white_check_mark: (if applicable) |
| < v1.0  | :x:                |

## Reporting a Vulnerability

**We take security seriously.** If you discover a security vulnerability in SemanticClaws, please report it privately — do **not** open a public issue.

Preferred method:
- Email: security@simplysemantics.com  
  (PGP key available on request or via keys.openpgp.org if needed)

Please include:
- Project: SemanticClaws – https://github.com/[your-username]/semanticclaws
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if you have one)
- Whether this should be considered public immediately

We aim to acknowledge reports within 48 hours and provide an update (including estimated timeline) within 7 days.

## Disclosure Policy

- We follow **responsible disclosure**.
- We coordinate fixes and releases before public announcement.
- After a fix is released, we publish details via GitHub Security Advisories and update CHANGELOG.md.
- We credit reporters (with permission) in release notes or Hall of Fame section.

## Security Best Practices in This Project

- **Rootless Podman** by default — no root privileges required.
- Non-root container user (`openclaw`).
- Minimal base images and dependencies.
- Secure token generation and 600/700 file permissions.
- Optional Trivy vulnerability scanning in setup.
- No cloud telemetry — fully local-first for privacy (aids CCPA/GDPR compliance).

## Security-Related Configuration

See our setup script and Dockerfile for hardening details:
- Rootless mode with subuid/subgid isolation.
- Network defaults to Podman's secure pasta backend (Podman 5.0+).
- Healthchecks and minimal exposed surface.

For questions or enterprise support (custom audits, SLAs), contact support@simplysemantics.com.

Thanks for helping make SemanticClaws safer for everyone!