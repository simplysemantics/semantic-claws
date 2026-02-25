# SemanticClaws Troubleshooting Guide

This guide helps resolve common installation and runtime issues when using the `setup-semanticclaws.sh` script, especially on **macOS** (Apple Silicon M-series). Most problems stem from Podman’s Linux VM setup rather than the script itself.

## Common Issues & Fixes

### 1. Podman machine won't start or `podman info` fails with "connection refused"

Symptoms:
- `podman machine ls` shows the machine but `RUNNING: No` or `Never`
- `podman info` errors: "unable to connect to Podman socket" or "dial tcp 127.0.0.1:...: connect: connection refused"

Cause: Podman VM (libkrun or qemu) stuck, socket not bound, stale state after repeated init/rm.

Fixes (in order):

1. Force clean-up:
   ```bash
   podman machine stop podman-machine-default || true
   podman machine rm --force podman-machine-default || true
   podman system connection rm podman-machine-default || true
   podman system connection rm podman-machine-default-root || true