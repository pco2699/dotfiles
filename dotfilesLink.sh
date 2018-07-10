#!/bin/sh
brew install tmux
brew install neovim/neovim/neovim
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

ln -sf ~/dotfiles/fishfile ~/.config/fish/fishfile
fisher

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/config.fish ~/.config/fish

ln -sf ~/dotfiles/peco_select_history.fish ~/.config/fish/functions
ln -sf ~/dotfiles/peco_select_repository.fish ~/.config/fish/functions
ln -sf ~/dotfiles/fish_user_key_bindings.fish ~/.config/fish/functions

ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/dein.toml ~/.config/nvim/
ln -sf ~/dotfiles/dein_lazy.toml ~/.config/nvim/ 
ln -sf ~/dotfiles/fish_prompt.fish ~/.config/fish/functions
