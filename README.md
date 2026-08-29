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

That installs the applications listed in `.chezmoidata/packages.yaml`, sets up
WSL with Debian, applies the key remappings in `.chezmoidata/keyboard.yaml` and
the Explorer settings in `.chezmoidata/explorer.yaml` — no dotfiles are written
to the Windows home directory. Expect UAC prompts: one for WSL, one for the
remapping, and one for each package that installs machine-wide (Git,
PowerToys). The Explorer settings are per-user and prompt for nothing.

Then reboot, run `wsl -d Debian` to create your Unix user, and follow the Quick
Install steps above inside WSL to get the shell environment.

If `chezmoi init` reports that a script `cannot be loaded because running
scripts is disabled on this system`, the generated chezmoi config predates the
`[interpreters.ps1]` settings that get around Windows' Restricted execution
policy. Re-run `chezmoi init --apply pco2699` to regenerate it; there is no need
to change the machine's execution policy.

To change the Windows application set, edit `.chezmoidata/packages.yaml` and run
`chezmoi apply` — the installer re-runs whenever that list changes.

### Windows key remapping

`.chezmoidata/keyboard.yaml` declares key remappings, applied on `chezmoi apply`.
Out of the box the left Windows key and caps lock both become left Ctrl. The
right Windows key still opens the Start menu, and nothing maps back to caps
lock, so a machine set up this way has no caps lock at all.

The mappings are written to the keyboard driver's `Scancode Map` — the registry
value [SharpKeys](https://github.com/randyrants/sharpkeys) edits through its GUI
— rather than to PowerToys' Keyboard Manager. That is what makes remapping the
Windows key work at all, since the shell claims its shortcuts before any
user-space remapper sees the key. It also means the change is machine-wide, is
in effect at the lock screen and in UAC prompts, and **only takes effect after a
reboot**.

Edit the list and run `chezmoi apply` to change it; empty the list to remove the
map and get the stock layout back. `Scancode Map` is a single value for the
whole machine, so applying this replaces anything SharpKeys wrote by hand.

### Windows Explorer settings

`.chezmoidata/explorer.yaml` declares the Folder Options checkboxes, applied on
`chezmoi apply`. Out of the box it shows file extensions and hidden files —
the two Explorer defaults worth undoing on a fresh machine.

These live under `HKCU`, so no administrator rights and no reboot are involved.
Explorer does cache them until it restarts, so the script restarts the shell
when (and only when) it actually changed something; any open Explorer windows
close with it. The data file lists a few other settings worth knowing.

## What's Included

- **Fish shell** with plugins managed by fisher, greeting a system summary via fastfetch
- **Neovim** with LazyVim configuration
- **Herdr** (terminal multiplexer) with tmux-style keybindings
- **mise** for managing runtimes (Node.js, Python, Go, Rust, Zig) and CLI tools (neovim, gh, ghq, ripgrep, fd, bat, fzf, zoxide, eza, herdr)
- **Claude Code** CLI (with `claude`/`cl` fish wrappers that run in auto permission mode)
- **Clipboard**: native tools locally, OSC 52 over SSH, win32yank on WSL
- **Windows key remapping** (Windows only): left Windows key and caps lock both act as left Ctrl, written straight into the keyboard driver
- **Windows Explorer** (Windows only): file extensions and hidden files shown

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

`.chezmoiscripts/run_onchange_after_install-packages.ps1.tmpl` does the Windows equivalent with winget, driven by `.chezmoidata/packages.yaml`, `.chezmoiscripts/run_onchange_after_remap-keyboard.ps1.tmpl` writes the key remappings from `.chezmoidata/keyboard.yaml`, and `.chezmoiscripts/run_onchange_after_configure-explorer.ps1.tmpl` writes the Explorer settings from `.chezmoidata/explorer.yaml`. Each script is wrapped in an OS guard and renders empty on the other platform, which chezmoi treats as "do not run".

## License

[MIT License](LICENSE)
