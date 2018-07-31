set -x GOPATH $HOME/.go
set PATH $PATH $GOPATH/bin
alias g='git'

set -x PATH $HOME/.pyenv/shims $PATH
tatus --is-interactive; and source (pyenv init -|psub)
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
set -x M2_HOME /usr/local/Cellar/maven@3.3/3.3.9/libexec

alias vi='nvim'

set -x XDG_CONFIG_HOME ~/.config

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
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
