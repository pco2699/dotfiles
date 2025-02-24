set -f GHQ_PATH $HOME/.ghq

set -x PATH $HOME/.local/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

alias g='git'

alias vi='nvim'

uname -a | grep -q microsoft
if [ $status -eq 0 ]
    alias open='wsl-open'
else
    alias open='lemonade open'
end


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


# asdf configuration
. ~/.asdf/asdf.fish
. ~/.asdf/plugins/golang/set-env.fish
