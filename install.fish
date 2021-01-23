#!/bin/fish

curl -sL https://git.io/fisher | source
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish
ln -sf ~/.dotfiles/config.fish ~/.config/fish

mkdir -p ~/.config/fish/functions
ln -sf ~/.dotfiles/peco_select_history.fish ~/.config/fish/functions
ln -sf ~/.dotfiles/peco_select_repository.fish ~/.config/fish/functions
ln -sf ~/.dotfiles/fish_user_key_bindings.fish ~/.config/fish/functions

fisher update

go get github.com/x-motemen/ghq
pip install powerline-status