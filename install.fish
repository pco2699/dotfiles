#!/usr/bin/fish

curl -sL https://git.io/fisher | source
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish
fisher update

mkdir -p ~/.config/fish/functions
ln -sf ~/.dotfiles/config.fish ~/.config/fish
. ~/.config/fish/config/fish

go install github.com/x-motemen/ghq@latest
ln -sf ~/.dotfiles/fish_user_key_bindings.fish ~/.config/fish/functions
