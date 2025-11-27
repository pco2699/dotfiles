#!/bin/bash

set -e

# Install chezmoi to ~/.local/bin from the repository
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHEZMOI_BIN="${SCRIPT_DIR}/bin/chezmoi"

if [ -f "${CHEZMOI_BIN}" ]; then
    echo "Installing chezmoi to ~/.local/bin..."
    mkdir -p ~/.local/bin
    cp -f "${CHEZMOI_BIN}" ~/.local/bin/chezmoi
    chmod +x ~/.local/bin/chezmoi
    echo "chezmoi installed successfully to ~/.local/bin/chezmoi"
else
    echo "Warning: ${CHEZMOI_BIN} not found. Skipping installation."
fi
