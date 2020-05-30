set -x GOPATH $HOME/.go
set PATH $PATH $GOPATH/bin
alias g='git'

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
set -x PATH $PATH $HOME/.local/bin
# set -x PATH $HOME/dev/flutter/bin $PATH
# status --is-interactive; and source (pyenv init -|psub)
# set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
# set -x M2_HOME /usr/local/Cellar/maven@3.3/3.3.9_1/libexec
# set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home
# set -x PATH /opt/platform-tools $PATH
# set -x CFLAGS -I(brew --prefix openssl)/include
# set -x LDFLAGS -L(brew --prefix openssl)/lib

set -x POWERLINE_CONFIG_COMMAND /home/pco2699/.pyenv/shims/powerline-config
set -x POWERLINE_COMMAND /home/pco2699/.local/bin/powerline

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
set __fish_git_prompt_char_stagedstate '->'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ktakayama/dev/misc/google-cloud-sdk/path.fish.inc' ]; . '/Users/ktakayama/dev/misc/google-cloud-sdk/path.fish.inc'; end

set -g theme_color_scheme solarized
