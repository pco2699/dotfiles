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

# mise (runtime version manager)
if type -q mise
    mise activate fish | source
end

zoxide init fish --cmd cd | source
