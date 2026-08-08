# pco2699's dotfiles

[![Test install](https://github.com/pco2699/dotfiles/actions/workflows/install.yml/badge.svg)](https://github.com/pco2699/dotfiles/actions/workflows/install.yml)

Managed with [chezmoi](https://chezmoi.io) for easy dotfiles management across multiple machines.

## Supported Platforms

- macOS (via Homebrew)
- Ubuntu/Debian (apt)
- Fedora (dnf)
- WSL2
- Windows (applications via winget; no dotfiles)

## Quick Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply pco2699
```

### For Windows + WSL

Windows and WSL are two separate chezmoi installations sharing this one
repository. Run both.

In Windows:

```powershell
winget install -e --id twpayne.chezmoi
chezmoi init --apply pco2699
```

That installs the applications listed in `.chezmoidata/packages.yaml` and sets up
WSL, and does nothing else — no dotfiles are written to the Windows home
directory. Expect UAC prompts: one for WSL, and one for each package that
installs machine-wide (Git, PowerToys).

Then reboot, run `wsl` to create your Unix user, and follow the Quick Install
steps above inside WSL to get the shell environment.

To change the Windows application set, edit `.chezmoidata/packages.yaml` and run
`chezmoi apply` — the installer re-runs whenever that list changes.

## What's Included

- **Fish shell** with plugins managed by fisher, greeting a system summary via fastfetch
- **Neovim** with LazyVim configuration
- **Herdr** (terminal multiplexer) with tmux-style keybindings
- **mise** for managing runtimes (Node.js, Python, Go, Rust, Zig) and CLI tools (neovim, gh, ghq, ripgrep, fd, bat, fzf, zoxide, eza, herdr)
- **Claude Code** CLI (with `claude`/`cl` fish wrappers that run in auto permission mode)
- **Clipboard**: native tools locally, OSC 52 over SSH, win32yank on WSL

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

`.chezmoiscripts/run_once_after_install-packages.sh.tmpl` detects your OS, installs fish + mise, then runs `mise install` to install every tool declared in `dot_config/mise/config.toml.tmpl`.

`.chezmoiscripts/run_onchange_after_install-packages.ps1.tmpl` does the Windows equivalent with winget, driven by `.chezmoidata/packages.yaml`. Each script is wrapped in an OS guard and renders empty on the other platform, which chezmoi treats as "do not run".

## License

[MIT License](LICENSE)
