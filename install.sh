#!/bin/bash
# Bootstrap script to install chezmoi and apply dotfiles
# Supports macOS, Ubuntu/Debian, and Fedora

set -e

echo "================================"
echo "Dotfiles Bootstrap Script"
echo "================================"

# Install chezmoi if not already installed
if ! command -v chezmoi &> /dev/null; then
    echo "Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
    export PATH="$HOME/.local/bin:$PATH"
fi

DOTFILES_DIR=$(dirname $(realpath $0))

# Initialize and apply chezmoi
echo "Initializing chezmoi with source directory: $DOTFILES_DIR"
chezmoi init --source="$DOTFILES_DIR"

echo "Applying dotfiles..."
chezmoi apply -v

echo "================================"
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Run 'chsh -s /usr/bin/fish' to set fish as your default shell"
echo "  2. Restart your shell"
echo "  3. Use 'chezmoi edit <file>' to edit dotfiles"
echo "  4. Use 'chezmoi apply' to apply changes"
echo "================================"
