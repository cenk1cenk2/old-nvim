#!/bin/bash

cd ~ || exit 127
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim || exit 127
sudo make CMAKE_BUILD_TYPE=Release install
cd ~ || exit 127
sudo rm -r neovim
