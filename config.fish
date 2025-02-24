set -f GHQ_PATH $HOME/.ghq

set -x GOPATH $HOME/.go
set -x GOROOT /usr/local/go
set -x PATH /usr/local/go/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.local/nvim-linux64/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/dev/v8/out/x64.optdebug $PATH
set -x PATH $GHQ_PATH/github.com/titzer/virgil/bin $PATH
set -x PATH $GHQ_PATH/github.com/titzer/virgil/bin/dev $PATH
set -x PATH $GHQ_PATH/github.com/pco2699/wizard-engine/bin $PATH
set -x PATH $GHQ_PATH/github.com/titzer/progress/bin $PATH
set -x PATH $GHQ_PATH/chromium.googlesource.com/chromium/tools/depot_tools $PATH
set -x PATH $GHQ_PATH/github.com/15-411-S23/dist/compiler/bin $PATH
set -x PATH $GHQ_PATH/github.com/composablesys/wish-you-were-fast/tools/bin $PATH
set -x PATH $GHQ_PATH/github.com/titzer/asplos2024-wizard-submission/experiments/dynamorio/bin64 $PATH

alias g='git'

alias vi='nvim'
alias open='wsl-open'

set -x XDG_CONFIG_HOME ~/.config

set -g theme_color_scheme solarized
set -g theme_nerd_fonts yes

# Fish git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showupstream yes
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '->'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind -

# opam configuration
source /home/pco2699/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

# asdf configuration
. ~/.asdf/asdf.fish
. ~/.asdf/plugins/golang/set-env.fish
