#!/bin/bash

SECONDS=0

source <(curl -s "https://gist.githubusercontent.com/cenk1cenk2/e03d8610534a9c78f755c1c1ed93a293/raw/3d61dc3718f3a3687d5990b9b5dc951198d29427/logger.sh")

LSP_FOLDER=~/.config/nvim/lsp-servers
NPM_EXTENSIONS=(
	"typescript;tsserver"
	"typescript-language-server"
	"bash-language-server"
	"eslint_d"
	"prettier"
	"vscode-json-languageserver"
	"vim-language-server"
	"yaml-language-server"
	"pyright;pyright-langserver"
	"vscode-html-languageserver-bin;html-languageserver"
	"graphql-language-service-cli;graphql-lsp"
	"dockerfile-language-server-nodejs;docker-langserver"
	"vscode-css-languageserver-bin;css-languageserver"
	"markdownlint-cli;markdownlint"
	"vls"
)
GO_EXTENSIONS=(
	"github.com/mattn/efm-langserver@latest"
	"github.com/client9/misspell/cmd/misspell@latest"
	"mvdan.cc/sh/v3/cmd/shfmt@latest"
	"golang.org/x/tools/gopls@latest"
	"golang.org/x/lint/golint@latest"
	"golang.org/x/tools/cmd/goimports"
)
PYTHON_EXTENSIONS=(
	"vim-vint;vint"
	"black"
	"isort"
	"flake8"
	"mypy"
)

log_this "[install-lsp]" "false" "lifetime" "bottom"

log_info "LSP Folder: ${LSP_FOLDER}"
mkdir -p ${LSP_FOLDER}
cd ${LSP_FOLDER} || exit 127

function split_string() {
	unset PACKAGE_NAME
	unset BIN_NAME
	i=0
	for data in $(echo "$1" | tr ";" "\n"); do
		if [ $i -eq 0 ]; then
			PACKAGE_NAME=$data
		elif [ $i -eq 1 ]; then
			BIN_NAME=$data
		fi
		i=$((i + 1))
	done

	if [ -z "$BIN_NAME" ]; then
		BIN_NAME=$PACKAGE_NAME
	fi
}

function install_and_link_binaries() {
	TYPE=$1
	BASE_DIR=$2
	INSTALL_COMMAND=$3
	ALL_EXTENSIONS=($4)
	ALL_BINARIES=($5)

	log_start "Installing $TYPE packages..." "top"

	if [ ${#ALL_EXTENSIONS[@]} -gt 0 ]; then
		log_this "${ALL_EXTENSIONS[*]}" "${CYAN}PACKAGE${RESET}" "INFO"

		eval "${INSTALL_COMMAND} ${ALL_EXTENSIONS[*]}"

		log_info "Linking binaries: ${ALL_BINARIES[*]}"
		for e in "${ALL_BINARIES[@]}"; do
			if [[ -L "$LSP_FOLDER/$e" ]]; then
				log_warn "Link already exists for $e, deleting it first."
				rm "$LSP_FOLDER/${e}"
			fi

			if [ ! -f "${BASE_DIR}/${e}" ]; then
				log_error "${e} is not a $TYPE binary."
				exit 127
			else
				ln -s "${BASE_DIR}/${e}" .
			fi
		done
	else
		log_warn "No $TYPE extensions to install. Skipping..."
	fi

	log_finish "Finished installing $TYPE packages."

}

function download_asset() {
	URL=$1
	BINARY=$2
	COMPRESSION=$3
	ASSET=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)

	TMP_DOWNLOAD_PATH="/tmp/${ASSET}"
	TMP_UNZIPPED_FOLDER="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"

	log_start "Downloading binary: $2 from $1" "top"
	curl -L "$URL" -o "$TMP_DOWNLOAD_PATH" -q

	log_info "Unzipping binary: $2 as $3"
	if [ "${COMPRESSION}" == "tar_xz" ]; then
		mkdir -p "${TMP_UNZIPPED_FOLDER}"
		tar xf "$TMP_DOWNLOAD_PATH" -C "${TMP_UNZIPPED_FOLDER}"
	elif [ "${COMPRESSION}" == "zip" ]; then
		unzip "$TMP_DOWNLOAD_PATH" -d "${TMP_UNZIPPED_FOLDER}"
	fi

	rm "${TMP_DOWNLOAD_PATH}"

	for e in "${BINARY[@]}"; do
		ASSET_TO_COPY="${TMP_UNZIPPED_FOLDER}/${e}"
		cp "${ASSET_TO_COPY}" "${LSP_FOLDER}"

		ASSET_NAME=$(basename -- "$ASSET_TO_COPY")
		chmod +x "${LSP_FOLDER}/${ASSET_NAME}"

		log_info "Asset copied to lsp folder: ${ASSET_NAME}"
	done

	rm "${TMP_UNZIPPED_FOLDER}" -r

	log_finish "Installed binary: ${ASSET_NAME}"
}

# for npm based extensions
ALL_NPM_EXTENSIONS=()
ALL_NPM_BINARIES=()
for e in "${NPM_EXTENSIONS[@]}"; do
	split_string "${e}"
	ALL_NPM_EXTENSIONS+=("${PACKAGE_NAME}")
	ALL_NPM_BINARIES+=("${BIN_NAME}")
done

install_and_link_binaries "NPM" "./node_modules/.bin/" "yarn add --prod" "${ALL_NPM_EXTENSIONS[*]}" "${ALL_NPM_BINARIES[*]}"

# for go based extensions
for e in "${GO_EXTENSIONS[@]}"; do
	log_start "Installing GO package: ${e}" "top"
	split_string ${e}

	GOPATH=$(pwd) GOBIN=$(pwd) GO111MODULE=on go get -v "${PACKAGE_NAME}"
	GOPATH=$(pwd) GO111MODULE=on go clean -modcache
	rm -rf src pkg 2>/dev/null

	log_finish "Installed GO package: ${e}"
done

# for python based extensions
ALL_PYTHON_EXTENSIONS=()
ALL_PYTHON_BINARIES=()
python3 -m venv ./venv
./venv/bin/pip3 install -U pip
for e in "${PYTHON_EXTENSIONS[@]}"; do
	split_string ${e}
	ALL_PYTHON_EXTENSIONS+=("${PACKAGE_NAME}")
	ALL_PYTHON_BINARIES+=("${BIN_NAME}")
done

install_and_link_binaries "Python" "./venv/bin/" "./venv/bin/pip3 install" "${ALL_PYTHON_EXTENSIONS[*]}" "${ALL_PYTHON_BINARIES[*]}"

## install custom stuff with curl, for compiled binaries mostly

log_start "Installing custom assets with curl..."

# install shell-check here
VERSION=v0.7.1
download_asset "https://github.com/koalaman/shellcheck/releases/download/${VERSION}/shellcheck-${VERSION}.linux.x86_64.tar.xz" "shellcheck-${VERSION}/shellcheck" "tar_xz"

log_finish "Installed lsp dependencies." "top"
log_info "$((SECONDS / 60)) minutes and $((SECONDS % 60)) seconds elapsed."
