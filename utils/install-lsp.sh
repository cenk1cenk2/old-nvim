#!/bin/bash

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
)
GO_EXTENSIONS=(
	"github.com/mattn/efm-langserver@latest"
	"github.com/client9/misspell/cmd/misspell@latest"
	"mvdan.cc/sh/v3/cmd/shfmt@latest"
)
PYTHON_EXTENSIONS=(
	"vim-vint;vint"
	"black"
	"isort"
	"flake8"
	"mypy"
)

echo "LSP Folder: ${LSP_FOLDER}"
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

	if [ ${#ALL_EXTENSIONS[@]} -gt 0 ]; then
		echo "Installing $TYPE packages: ${ALL_EXTENSIONS[*]}"
		eval "${INSTALL_COMMAND} ${ALL_EXTENSIONS[*]}"

		echo "Linking binaries: ${ALL_BINARIES[*]}"
		for e in "${ALL_BINARIES[@]}"; do
			if [[ -L "$LSP_FOLDER/$e" ]]; then
				echo "Link already exists for $e, deleting it first."
				rm "$LSP_FOLDER/${e}"
			fi

			if [ ! -f "${BASE_DIR}/${e}" ]; then
				echo "${e} is not a $TYPE binary."
				exit 127
			else
				ln -s "${BASE_DIR}/.bin/${e}" .
			fi
		done
	else
		echo "No $TYPE extensions to install. Skipping..."
	fi

}

function download_asset() {
	URL=$1
	BINARY=$2
	COMPRESSION=$3
	ASSET=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)

	TMP_DOWNLOAD_PATH="/tmp/${ASSET}"
	TMP_UNZIPPED_FOLDER="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"

	echo "Downloading binary: $2 from $1"
	curl -L "$URL" -o "$TMP_DOWNLOAD_PATH" -q

	echo "Unzipping binary: $2 as $3"
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

		echo "Asset copied to lsp folder: ${ASSET_NAME}"
	done

	rm "${TMP_UNZIPPED_FOLDER}" -r
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
	echo "Installing GO package: ${e}"
	split_string ${e}

	GOPATH=$(pwd) GOBIN=$(pwd) GO111MODULE=on go get -v "${PACKAGE_NAME}"
	GOPATH=$(pwd) GO111MODULE=on go clean -modcache
	rm -rf src pkg 2>/dev/null
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

install_and_link_binaries "Python" "./venv/bin/" "./vent/bin/pip3 install" "${ALL_PYTHON_EXTENSIONS[*]}" "${ALL_PYTHON_BINARIES[*]}"

## install custom stuff with curl, for compiled binaries mostly

echo "Installing custom assets with curl..."

# install shell-check here
echo "Will install shellcheck..."
VERSION=v0.7.1
download_asset "https://github.com/koalaman/shellcheck/releases/download/${VERSION}/shellcheck-${VERSION}.linux.x86_64.tar.xz" "shellcheck-${VERSION}/shellcheck" "tar_xz"
