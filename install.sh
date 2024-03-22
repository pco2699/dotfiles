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
    brew install reattach-to-user-namespace
elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-add-repository -y ppa:fish-shell/release-3
    sudo apt update
    sudo apt -y install fish
    sudo apt -y install tmux
    sudo apt -y install peco
    sudo apt -y install powerline
    sudo apt -y install gh
    sudo apt -y install zip
    # required by asdf
    sudo aot -y install dirmngr gpg curl gawk 

    # install nvim
    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
    sudo apt install ./nvim-linux64.deb
    rm -rf nvim-linux64.deb
fi

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
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

# install astro nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/pco2699/astronvim_config.git ~/.config/nvim/lua/user

# tmux conf
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

if [[ "$OSTYPE" = "darwin"* ]]; then
    pip3 install powerline-status
    asdf reshim python
elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
    go install github.com/x-motemen/ghq@latest
fi

# ghq conf
mkdir ~/.ghq
git config --global ghq.root "~/.ghq"

chsh -s /usr/bin/fish
fish -l
