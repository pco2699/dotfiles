#!/bin/bash
if [[ "$OSTYPE" = "darwin"* ]]; then
    brew update 
    brew install fish
    brew install tmux
    brew install neovim
    brew install go
    brew install ghq
    brew install peco
    brew install gh
    # TODO: add powerline
elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-add-repository -y ppa:fish-shell/release-3
    sudo apt update
    sudo apt -y install fish
    sudo apt -y install tmux
    sudo apt -y install neovim
    sudo apt -y install peco
    sudo apt -y install python3-pip
    sudo apt -y install powerline
    sudo apt -y install gh
fi

# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm -rf ./installer.sh

# install pyenv
curl https://pyenv.run | bash

# install go
wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
mkdir ~/.go

ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/dein.toml ~/.config/nvim/
ln -sf ~/.dotfiles/dein_lazy.toml ~/.config/nvim/ 

fish ~/.dotfiles/install.fish

chsh -s /usr/bin/fish
fish -l
