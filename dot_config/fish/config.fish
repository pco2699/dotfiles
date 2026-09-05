fish_add_path -g ~/.local/bin ~/.cargo/bin

set -gx XDG_CONFIG_HOME ~/.config
set -gx EDITOR nvim

# mise (runtime version manager)
if type -q mise
    mise activate fish | source
end

# WSL: drop the Windows Node install from PATH. Unlike the other Windows tools
# WSL inherits (gh, tailscale, ...) which are .exe-only and so never match a
# bare command name, the Node installer also ships extensionless `npm`, `npx`
# and `corepack` scripts. Those are valid PATH hits from Linux, so whenever a
# repo pins a mise node/npm version that isn't installed yet, mise drops its
# own bin dir and `npx` silently becomes the Windows one. Kept out of the
# is-interactive block below so scripts resolve the same npx, and after
# `mise activate` so nothing re-adds the entry afterwards.
if test -n "$WSL_DISTRO_NAME"
    set -gx PATH (string match -v -r '^/mnt/c/Program Files/nodejs/?$' -- $PATH)
end

if status is-interactive
    # abbreviations expand inline, so full commands land in history
    abbr -a g git
    abbr -a vi nvim

    # modern replacements for the classic tools
    alias cat='bat'
    alias ls='eza --group-directories-first --icons'
    alias ll='eza -lah --group-directories-first --icons'
    alias tree='eza --tree --level=3 --icons'
    alias grep='rg'
    alias less='bat --paging=always'
    alias find='fd'

    # WSL: open links in the Windows default browser via explorer.exe (no extra
    # package needed - WSL puts Windows binaries on PATH automatically)
    if test -n "$WSL_DISTRO_NAME"
        set -gx BROWSER explorer.exe
    end

    # FZF configuration (tokyonight)
    set -gx FZF_DEFAULT_OPTS "\
--layout=reverse \
--height=70% \
--border=rounded \
--info=inline \
--margin=1 \
--padding=1 \
--pointer='▶' \
--marker='✓' \
--prompt='❯ ' \
--color=bg+:#33467c,bg:#1a1b26,spinner:#7dcfff,hl:#f7768e \
--color=fg:#c0caf5,header:#f7768e,info:#bb9af7,pointer:#7dcfff \
--color=marker:#9ece6a,fg+:#c0caf5,prompt:#bb9af7,hl+:#f7768e \
--bind='ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"

    if type -q zoxide
        zoxide init fish --cmd cd | source
    end

    # Disable fzf.fish's ctrl-v binding (variables search) — frees ctrl-v for
    # normal paste. Fisher may not have installed the plugin yet on a new host.
    if functions -q fzf_configure_bindings
        fzf_configure_bindings --variables=''
    end
end
