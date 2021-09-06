#!/bin/bash

SECONDS=0
COMMIT_SHA="7a0468e7addc8745d82abdfb62d25714f38dae8f"

## inject logger
LOG_LEVEL=${LOG_LEVEL-"INFO"}
source <(curl -s "https://gist.githubusercontent.com/cenk1cenk2/e03d8610534a9c78f755c1c1ed93a293/raw/3d61dc3718f3a3687d5990b9b5dc951198d29427/logger.sh")

log_this "[install-nvim]" "false" "lifetime" "bottom"

ASSET=$(tr -cd 'a-f0-9' </dev/urandom | head -c 32)

TMP_DOWNLOAD_PATH="/tmp/${ASSET}"

log_debug "Temporary path: ${TMP_DOWNLOAD_PATH}"

log_start "Downloading neovim head~0..."
git clone https://github.com/neovim/neovim "$TMP_DOWNLOAD_PATH"
log_finish "Neovim cloned."

cd "$TMP_DOWNLOAD_PATH" || exit 127

if [ -n "${COMMIT_SHA}" ]; then
	log_warn "Certain commit sha is set: ${COMMIT_SHA}"
	git checkout "${COMMIT_SHA}"
fi

log_start "Building neovim..."
sudo make CMAKE_BUILD_TYPE=Release install
log_finish "Finished installing neovim."

log_debug "Clean up temporary path."
sudo rm -r "$TMP_DOWNLOAD_PATH"

if [ -f "/bin/nvim" ]; then
	log_warn "Neovim installed with fuse appimage deleting it first."
	sudo rm /bin/nvim
fi

## goodbye
log_finish "Built neovim in $((SECONDS / 60)) minutes and $((SECONDS % 60)) seconds." "top"
