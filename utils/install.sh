#!/bin/bash

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

SECONDS=0

## inject logger
LOG_LEVEL=${LOG_LEVEL-"INFO"}
source <(curl -s "https://gist.githubusercontent.com/cenk1cenk2/e03d8610534a9c78f755c1c1ed93a293/raw/3d61dc3718f3a3687d5990b9b5dc951198d29427/logger.sh")

installpynvim() {
	log_warn "Installing pynvim..."
	pip3 install pynvim --user
}

installpacker() {
	log_warn "Installing packer itself..."
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

# Welcome
log_this "[install-nvim]" "false" "lifetime" "bottom"

# install pynvim
pip3 list | grep pynvim >/dev/null && echo "pynvim installed, moving on..." || installpynvim

# move old nvim directory if it exists
if [ -d "$HOME/.config/nvim" ]; then
	log_warn "Moving your config to nvim.old"
	mv ~/.config/nvim ~/.config/nvim.old
fi

# move old nvim directory if it exists
if [ -d "$HOME/.config/coc" ]; then
	log_warn "Moving your coc to coc.old"
	mv ~/.config/coc ~/.config/coc.old
fi

# clone config down
log_start "Cloning neovim configuration..."
git clone git@github.com:cenk1cenk2/nvim.git ~/.config/nvim
log_finish "Cloned neovim configuration...."

if [ -a "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	log_info 'Packer already installed.'
else
	installpacker
fi

# install plugins
which nvim >/dev/null

# install stuff for lsp
# bash "$HOME/.config/nvim/utils/install-lsp.sh"

## goodbye
log_finish "Installed neovim configuration in $((SECONDS / 60)) minutes and $((SECONDS % 60)) seconds." "top"
