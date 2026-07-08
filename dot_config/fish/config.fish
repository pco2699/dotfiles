set -f GHQ_PATH $HOME/.ghq

set -x PATH $HOME/.local/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

alias g='git'
alias vi='nvim'

alias cat='bat'
alias ls='eza --group-directories-first --icons'
alias ll='eza -lah --group-directories-first --icons'
alias tree='eza --tree --level=3 --icons'
alias grep='rg'
alias less='bat --paging=always'
alias find='fd'

set -x XDG_CONFIG_HOME ~/.config
set -x EDITOR nvim

# WSL: open links in the Windows default browser (wslview, from the wslu package)
if test -n "$WSL_DISTRO_NAME"
    set -x BROWSER wslview
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

# mise (runtime version manager)
if type -q mise
    mise activate fish | source
end

zoxide init fish --cmd cd | source
