set -x GOPATH $HOME/.go
set -x PATH /usr/local/go/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

alias g='git'

alias vi='nvim'

set -x XDG_CONFIG_HOME ~/.config

set -g theme_color_scheme solarized
set -g theme_nerd_fonts yes

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '->'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# opam configuration
source /home/pco2699/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# asdf configuration
. ~/.asdf/asdf.fish
. ~/.asdf/plugins/golang/set-env.fish
