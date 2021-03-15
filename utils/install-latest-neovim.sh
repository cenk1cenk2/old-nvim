#!/bin/bash

ASSET=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)

TMP_DOWNLOAD_PATH="/tmp/${ASSET}"

git clone https://github.com/neovim/neovim "$TMP_DOWNLOAD_PATH"
cd "$TMP_DOWNLOAD_PATH" || exit 127
sudo make CMAKE_BUILD_TYPE=Release install
sudo rm -r "$TMP_DOWNLOAD_PATH"
sudo rm /bin/nvim
