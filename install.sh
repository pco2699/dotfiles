#!/bin/bash
if [[ "$OSTYPE" = "darwin"* ]]; then
    brew update 
    brew install fish
    brew install tmux
    brew install neovim
    brew install go
    brew install ghq
    brew install peco
    # TODO: add powerline
elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
    sudo apt-add-repository -y ppa:fish-shell/release-3
    sudo apt update
    sudo apt -y install fish
    sudo apt -y install tmux
    sudo apt -y install neovim
    sudo apt -y install golang-go
    sudo apt -y install peco
    sudo apt -y install python3-pip
fi

# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

# install pyenv
curl https://pyenv.run | bash

ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/dein.toml ~/.config/nvim/
ln -sf ~/.dotfiles/dein_lazy.toml ~/.config/nvim/ 

fish ~/.dotfiles/install.fish

sudo chsh -s /usr/bin/fish
fish -l