#!/usr/bin/env bash
#
# SemanticClaws Cleanup Script
# ----------------------------------------------------------------
# Company: Simply Semantics (www.simplysemantics.com)
# Purpose: Reset everything so you can test setup-semanticclaws.sh from scratch
#          Removes container, image, data folder, and optionally the Podman VM
#
# WARNING: This script deletes data permanently — use with care!
#          Review before running.

set -euo pipefail

# -------------------------------
# Configuration
# -------------------------------
readonly PROJECT="semantic-claws"
readonly IMAGE_NAME="${PROJECT}:local"
readonly CONTAINER_NAME="semantic-claws-test"
readonly OPENCLAW_HOME="${HOME}/.local/share/${PROJECT}"

# Colors
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

# -------------------------------
# Helper Functions
# -------------------------------
info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; exit 1; }

confirm() {
    read -p "$1 (y/N): " choice
    [[ "$choice" =~ ^[Yy]$ ]] || error "Aborted by user."
}

# -------------------------------
# Cleanup Steps
# -------------------------------
main() {
    echo "This will delete:"
    echo "  - Container: ${CONTAINER_NAME}"
    echo "  - Image: ${IMAGE_NAME}"
    echo "  - Data folder: ${OPENCLAW_HOME}"
    echo "  - (Optional) Podman machine: podman-machine-default"
    echo ""
    confirm "Are you sure you want to continue?"

    # Stop and remove container
    if podman ps -a --filter name="${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "${CONTAINER_NAME}"; then
        info "Stopping container ${CONTAINER_NAME}..."
        podman stop "${CONTAINER_NAME}" || true
        info "Removing container ${CONTAINER_NAME}..."
        podman rm "${CONTAINER_NAME}" || true
    else
        info "No container named ${CONTAINER_NAME} found."
    fi

    # Remove image
    if podman images --format '{{.Repository}}:{{.Tag}}' | grep -q "${IMAGE_NAME}"; then
        info "Removing image ${IMAGE_NAME}..."
        podman rmi "${IMAGE_NAME}" || true
    else
        info "No image named ${IMAGE_NAME} found."
    fi

    # Remove data/config directory
    if [[ -d "${OPENCLAW_HOME}" ]]; then
        info "Removing data folder ${OPENCLAW_HOME}..."
        rm -rf "${OPENCLAW_HOME}" || error "Failed to remove ${OPENCLAW_HOME}"
    else
        info "No data folder ${OPENCLAW_HOME} found."
    fi

    # Optional: Reset Podman machine (uncomment if you want full VM reset every time)
    # info "Stopping Podman machine..."
    # podman machine stop podman-machine-default || true
    # info "Removing Podman machine..."
    # podman machine rm --force podman-machine-default || true
    # info "Podman machine reset complete (re-init when you run setup script)."

    info "${GREEN}Cleanup finished!${NC}"
    info "You can now re-run ./setup-semanticclaws.sh for a clean test."
}

main "$@"