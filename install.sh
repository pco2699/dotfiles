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
    sudo apt -y install zip
fi

# install pyenv
curl https://pyenv.run | bash

# install sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# install java, maven
sdk install java 19.0.1-amzn
sdk install maven

# install go
wget https://golang.org/dl/go1.19.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
rm -rf go1.19.1.linux-amd64.tar.gz
mkdir ~/.go

ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim

curl -sL https://git.io/fisher | source

mkdir -p ~/.config/fish/functions
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish
ln -sf ~/.dotfiles/config.fish ~/.config/fish

ln -sf ~/.dotfiles/peco_select_history.fish ~/.config/fish/functions
ln -sf ~/.dotfiles/peco_select_repository.fish ~/.config/fish/functions
ln -sf ~/.dotfiles/fish_user_key_bindings.fish ~/.config/fish/functions

fisher update

source ~/.config/fish/config.fish

go install github.com/x-motemen/ghq@latest
mkdir ~/.ghq
git config --global ghq.root "~/.ghq"

chsh -s /usr/bin/fish
fish -l
