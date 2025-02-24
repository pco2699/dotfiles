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
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
	sudo apt-add-repository -y ppa:fish-shell/release-3
	sudo apt update
	sudo apt -y install fish tmux peco gh zip

	# required by asdf
	sudo apt -y install dirmngr gpg curl gawk

	# required by python
	sudo apt -y install build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev curl git \
		libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

	# install nvim
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	tar -C ~/.local/ --strip-components=1 -xzf nvim-linux64.tar.gz
	rm -rf ~/.local/bin/README.md
	rm -rf ~/.local/bin/LICENSE
	rm -rf nvim-linux64.tar.gz

	# install win32yank
	curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
	unzip win32yank-x64.zip -d ~/.local/bin
	rm -rf win32yank-x64.zip
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
asdf plugin-add golang
asdf install golang latest
asdf global golang latest

# zig setup
asdf plugin-add zig
asdf install zig latest
asdf global zig latest

# install lazy nvim
ln -sf ~/.dotfiles/nvim/ ~/.config/nvim/

# tmux conf
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [[ "$OSTYPE" = "darwin"* ]]; then
	asdf reshim python
fi

# ghq conf
go install github.com/x-motemen/ghq@latest
mkdir ~/.ghq
git config --global ghq.root "~/.ghq"

# install lemonade
curl -LO https://github.com/lemonade-command/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
tar -C ~/.local/bin -xzf lemonade_linux_amd64.tar.gz

# install fisher
mkdir -p ~/.config/fish/functions
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish/fish_plugins
fish -c "curl -sL https://git.io/fisher | source; fisher update"

# link fish config
ln -sf ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/.dotfiles/fish_user_key_bindings.fish ~/.config/fish/functions/fish_user_key_bindings.fish

echo "Please run 'chsh -s $(which fish)' to change your shell to fish"
