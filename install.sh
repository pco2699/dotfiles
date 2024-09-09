#!/bin/bash

mkdir -p ~/.local/bin

if [[ "$OSTYPE" = "darwin"* ]]; then
    brew update 
    brew install fish
    brew install tmux
    brew install neovim
    brew install go
    brew install ghq
    brew install peco
    brew install gh
elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-add-repository -y ppa:fish-shell/release-3
    sudo apt update
    sudo apt -y install fish
    sudo apt -y install tmux
    sudo apt -y install peco
    sudo apt -y install gh
    sudo apt -y install zip
    # required by asdf
    sudo aot -y install dirmngr gpg curl gawk 

    # install nvim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    tar -C ~/.local/ -xzf nvim-linux64.tar.gz

    # install win32yank
    curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
    unzip win32yank-x64.zip -d ~/.local/bin
fi

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
. "$HOME/.asdf/asdf.sh"

# nodejs setup
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

# python setup
asdf plugin-add python
asdf install python latest
asdf global python latest

# go setup
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest

# install tree-sitter
npm install -g tree-sitter-cli

# tmux conf
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

if [[ "$OSTYPE" = "darwin"* ]]; then
    asdf reshim python
fi

# ghq conf
mkdir ~/.ghq
git config --global ghq.root "~/.ghq"

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

chsh -s /usr/bin/fish
fish -l
