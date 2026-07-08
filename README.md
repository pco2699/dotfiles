# pco2699's dotfiles

[![Test install](https://github.com/pco2699/dotfiles/actions/workflows/install.yml/badge.svg)](https://github.com/pco2699/dotfiles/actions/workflows/install.yml)

Managed with [chezmoi](https://chezmoi.io) for easy dotfiles management across multiple machines.

## Supported Platforms

- macOS (via Homebrew)
- Ubuntu/Debian (apt)
- Fedora (dnf)
- WSL2

## Quick Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply pco2699
```

### For Windows + WSL
In Windows:
```powershell
wsl --install
```

Then in WSL, follow the Quick Install steps above.

## What's Included

- **Fish shell** with plugins managed by fisher
- **Neovim** with LazyVim configuration
- **Herdr** (terminal multiplexer) with tmux-style keybindings
- **mise** for managing runtimes (Node.js, Python, Go, Rust, Zig) and CLI tools (neovim, gh, ghq, ripgrep, fd, bat, fzf, zoxide, eza, herdr)
- **Claude Code** CLI (with `claude`/`cl` fish wrappers that run in auto permission mode)
- **Clipboard**: OSC 52 everywhere (no external clipboard tools needed)

## Usage

After installation:

```bash
# Set fish as your default shell
chsh -s /usr/bin/fish

# Edit dotfiles
chezmoi edit ~/.config/fish/config.fish

# Apply changes
chezmoi apply

# Update dotfiles from the repository
chezmoi update

# Add a new dotfile
chezmoi add ~/.bashrc
```

## Customization

Edit files in `~/.local/share/chezmoi/` or use `chezmoi edit <file>` to modify your dotfiles.

The installation script (`run_once_after_install-packages.sh.tmpl`) detects your OS, installs fish + mise, then runs `mise install` to install every tool declared in `dot_config/mise/config.toml.tmpl`.

## License

[MIT License](LICENSE)
