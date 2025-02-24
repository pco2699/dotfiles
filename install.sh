#!/bin/bash

DOTFILES_DIR=$(dirname $(realpath $0))
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
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	tar -C ~/.local/ --strip-components 1 -xzf nvim-linux-x86_64.tar.gz
	rm -rf ~/.local/bin/README.md
	rm -rf ~/.local/bin/LICENSE
	rm -rf nvim-linux-x86_64.tar.gz

	# install win32yank
	curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
	unzip win32yank-x64.zip -d ~/.local/bin
	rm -rf win32yank-x64.zip
fi

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
source "$HOME/.asdf/asdf.sh"

# install lazy nvim
ln -sf $DOTFILES_DIR/nvim/ ~/.config/nvim/

# tmux conf
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/.tmux.conf.* ~
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
ln -sf $DOTFILES_DIR/fish_plugins ~/.config/fish/fish_plugins
fish -c "curl -sL https://git.io/fisher | source; fisher update"

# link fish config
ln -sf $DOTFILES_DIR/config.fish ~/.config/fish/config.fish
ln -sf $DOTFILES_DIR/fish_user_key_bindings.fish ~/.config/fish/functions/fish_user_key_bindings.fish

if [ "$CODESPACES" == true ]; then
	sudo chsh "$(id -un)" --shell /usr/bin/fish
else
	# install the required env of asdf only on not-codespaces ones
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
	echo "run chsh -s /usr/bin/fish on your shell"
fi

fish -l
