#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew update 
    brew install fish
    brew install tmux
    brew install neovim
    brew install go
    brew install ghq
    brew install peco
    # TODO: add powerline
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-add-repository -y ppa:fish-shell/release-3
    sudo apt update
    sudo apt -y install fish
    sudo apt -y install tmux
    sudo apt -y install neovim
    sudo apt -y install golang-go
    sudo apt -y install peco
    # TODO: add ghq
    # TODO: add powerline
fi

# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

# install pyenv
curl https://pyenv.run | bash

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

ln -sf ~/.dotfiles/fishfile ~/.config/fish/fishfile

ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/config.fish ~/.config/fish

ln -sf ~/.dotfiles/peco_select_history.fish ~/.config/fish/functions
ln -sf ~/.dotfiles/peco_select_repository.fish ~/.config/fish/functions
ln -sf ~/.dotfiles/fish_user_key_bindings.fish ~/.config/fish/functions

ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/dein.toml ~/.config/nvim/
ln -sf ~/.dotfiles/dein_lazy.toml ~/.config/nvim/ 
ln -sf ~/.dotfiles/fish_prompt.fish ~/.config/fish/functions

chsh -s /usr/bin/fish
fish -l