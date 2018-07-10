set -x GOPATH $HOME/.go
set PATH $PATH $GOPATH/bin

set -x PATH $HOME/.pyenv/shims $PATH
. (pyenv init - | psub)
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
set -x M2_HOME /usr/local/Cellar/maven@3.3/3.3.9/libexec

alias vi='nvim'

set -x XDG_CONFIG_HOME ~/.config

