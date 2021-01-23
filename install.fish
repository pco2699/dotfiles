#!/bin/fish

curl -sL https://git.io/fisher | source
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish
fisher update

go -v