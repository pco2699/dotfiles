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

set -g theme_color_scheme solarized
set -g theme_nerd_fonts yes

# asdf configuration
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

zoxide init fish --cmd cd | source
