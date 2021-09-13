#!/bin/bash

SECONDS=0

## inject logger
LOG_LEVEL=${LOG_LEVEL-"INFO"}
source <(curl -s "https://gist.githubusercontent.com/cenk1cenk2/e03d8610534a9c78f755c1c1ed93a293/raw/3d61dc3718f3a3687d5990b9b5dc951198d29427/logger.sh")

## set lsp folder
LSP_FOLDER=~/.local/share/nvim/lsp-servers

## help string
HELP=$(
	cat <<-END
		Installs dependencies for language servers for neovim. Supports node, python, go, binary and vscode-extensions.

		${0} [command]
		help    shows this help
		clean   deletes LSP_FOLDER at ${LSP_FOLDER} and performs a clean install

		You can use LOG_LEVEL=DEBUG ${0} for debugging output.
		You can use LOG_LEVEL=LIFETIME ${0} for less output.
	END
)

## greet
log_this "[install-lsp]" "false" "lifetime" "bottom"

## argument parsing
# generate help
if [[ -n $1 && $1 == "help" && -n $HELP ]]; then
	echo "$HELP"
	exit 0
fi

# clean argument
if [[ -n $1 && $1 == "clean" ]]; then
	if [ -d "${LSP_FOLDER}" ]; then
		log_warn "Removing LSP folder for clean install: ${LSP_FOLDER}"
		sudo rm -r "${LSP_FOLDER}"
	else
		log_error "LSP folder is not really a folder: ${LSP_FOLDER}"
		ls -la "${LSP_FOLDER}"
		exit 127
	fi
fi

## some general variables

# format: [extensions-name];[binary-name]
NPM_EXTENSIONS=(
	"typescript@next;tsserver"
	"typescript-language-server"
	"bash-language-server"
	"eslint_d"
	"prettier"
	"vim-language-server"
	"yaml-language-server"
	"pyright;pyright-langserver"
	"graphql-language-service-cli;graphql-lsp"
	"dockerfile-language-server-nodejs;docker-langserver"
	"markdownlint-cli;markdownlint"
	"vls"
	"eslint;false"
	"vscode-languageserver-protocol@next;false"
	"unofficial-grammarly-language-server;unofficial-grammarly-language-server"
	"markdown-toc"
	"stylelint-lsp"
	"@fsouza/prettierd;prettierd"
	"ansible-language-server"
)

# format: [extensions-name];[binary-name]
GO_EXTENSIONS=(
	"github.com/mattn/efm-langserver@latest;efm-langserver"
	"github.com/client9/misspell/cmd/misspell@latest;misspell"
	"mvdan.cc/sh/v3/cmd/shfmt@latest;shfmt"
	"golang.org/x/tools/gopls@latest;gopls"
	"golang.org/x/lint/golint@latest;golint"
	"golang.org/x/tools/cmd/goimports@latest;goimports"
)

# format: [extensions-name];[binary-name]
PYTHON_EXTENSIONS=(
	"vim-vint;vint"
	"black"
	"isort"
	"flake8"
	"mypy"
)

## create and change in to lsp folder
log_this "${LSP_FOLDER}" "${MAGENTA}LSP-FOLDER${RESET}" "lifetime"

mkdir -p ${LSP_FOLDER}
cd ${LSP_FOLDER} || exit 127

## functions

# splits a string by ; delimiter. first one is package name and second one is the binary name if any.
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

# installs scripts via npm, pip or go get, supports binary linking and cleaning afterwards
function install_and_link_binaries() {
	TYPE=$1
	EXTENSIONS=($2)

	unset BASE_DIR
	unset INSTALL_COMMAND
	unset CLEAN_COMMAND
	unset ALL_EXTENSIONS
	unset ALL_BINARIES

	log_start "Installing $TYPE packages..." "top"

	if [ "$TYPE" = "node" ]; then
		BASE_DIR="./node_modules/.bin"
		INSTALL_COMMAND="yarn add --prod"
	elif [ "$TYPE" = "python" ]; then
		BASE_DIR="./venv/bin"
		INSTALL_COMMAND="./venv/bin/pip3 install"
	elif [ "$TYPE" = "go" ]; then
		BASE_DIR="./bin"
		INSTALL_COMMAND="GOPATH=$(pwd) go install"
		CLEAN_COMMAND=("GOPATH=$(pwd) go clean -modcache" "rm -rf src pkg 2>/dev/null")
	else
		log_error "Package type not supported: ${TYPE}"

		exit 127
	fi

	ALL_EXTENSIONS=()
	ALL_BINARIES=()
	for e in "${EXTENSIONS[@]}"; do
		split_string "${e}"
		ALL_EXTENSIONS+=("${PACKAGE_NAME}")
		ALL_BINARIES+=("${BIN_NAME}")
	done

	if [ ${#ALL_EXTENSIONS[@]} -gt 0 ]; then
		log_this "${ALL_EXTENSIONS[*]}" "${CYAN}PACKAGE${RESET}" "INFO"

		if [ "$TYPE" = "go" ]; then
			for e in "${ALL_EXTENSIONS[@]}"; do
				eval "${INSTALL_COMMAND} ${e}"
			done
		else
			eval "${INSTALL_COMMAND} ${ALL_EXTENSIONS[*]}"
		fi

		if [ -n "${BASE_DIR}" ]; then
			log_info "Linking binaries: ${ALL_BINARIES[*]}"

			for e in "${ALL_BINARIES[@]}"; do
				if [[ -L "$LSP_FOLDER/$e" ]]; then
					log_debug "Link already exists for $e, deleting it first."
					rm "$LSP_FOLDER/${e}"
				fi

				if [ "$e" != "false" ] && [ ! -f "${BASE_DIR}/${e}" ]; then
					log_error "${e} is not a $TYPE binary."
					log_info "Binaries listed as follows:"
					ls -la "${BASE_DIR}"
					exit 127
				elif [ "$e" == "false" ]; then
					log_debug "No binary for library."
				else
					log_debug "Linking executable: ${BASE_DIR}/${e}"
					ln -s "${BASE_DIR}/${e}" .
				fi
			done

		fi

		if [ -n "${CLEAN_COMMAND[*]}" ]; then
			log_info "Executing post-installation cleaning: ${CLEAN_COMMAND[*]}"

			for COMMAND in "${CLEAN_COMMAND[@]}"; do

				eval "${COMMAND}"

			done
		fi

	else
		log_warn "No $TYPE extensions to install. Skipping..."
	fi

	log_finish "Finished installing $TYPE packages."

}

# fetchs a url with curl
function fetch_url() {
	URL=$1
	TMP_DOWNLOAD_PATH=$2

	curl -L "$URL" -o "$TMP_DOWNLOAD_PATH" -q
}

# extracts a archive supports tar.gz tar.xz or zip so vsix too
function extract_archive() {
	TMP_DOWNLOAD_PATH=$1
	TMP_UNZIPPED_FOLDER=$2
	COMPRESSION=$3

	log_debug "Unzipping file: $TMP_DOWNLOAD_PATH as $COMPRESSION"

	if [ "${COMPRESSION}" == "tar_gz" ]; then
		mkdir -p "${TMP_UNZIPPED_FOLDER}"
		tar zxpf "$TMP_DOWNLOAD_PATH" -C "${TMP_UNZIPPED_FOLDER}"
	elif [ "${COMPRESSION}" == "tar_xz" ]; then
		mkdir -p "${TMP_UNZIPPED_FOLDER}"
		tar xf "$TMP_DOWNLOAD_PATH" -C "${TMP_UNZIPPED_FOLDER}"
	elif [ "${COMPRESSION}" == "zip" ]; then
		unzip -qq "$TMP_DOWNLOAD_PATH" -d "${TMP_UNZIPPED_FOLDER}"
	elif [ "${COMPRESSION}" == "none" ]; then
		cp -v "${TMP_DOWNLOAD_PATH}" "${TMP_UNZIPPED_FOLDER}"
		log_warn "No unzipping pattern found, using none."
	else
		log_error "Unknown archive type: ${COMPRESSION}"
		exit 127
	fi

	if [ $? -gt 0 ]; then
		log_error "Unzipping unsuccesfull: ${TMP_DOWNLOAD_PATH} as ${COMPRESSION}"
		exit 127
	fi
}

# download a binary with cat then unarchive and chmod it
function download_binary() {
	URL=$1
	COMPRESSION=$2
	BINARY=($3)

	unset TMP_DOWNLOAD_PATH
	unset TMP_UNZIPPED_FOLDER
	unset ASSET_NAME
	unset ASSET_TO_COPY

	TMP_DOWNLOAD_PATH="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"
	TMP_UNZIPPED_FOLDER="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"

	log_start "Downloading binary: ${BINARY[*]} from $URL" "top"

	fetch_url "${URL}" "${TMP_DOWNLOAD_PATH}"

	extract_archive "${TMP_DOWNLOAD_PATH}" "${TMP_UNZIPPED_FOLDER}" "${COMPRESSION}"

	rm "${TMP_DOWNLOAD_PATH}"

	for e in "${BINARY[@]}"; do
		if [ "${COMPRESSION}" != "none" ]; then
			ASSET_TO_COPY="${TMP_UNZIPPED_FOLDER}/${e}"
			cp "${ASSET_TO_COPY}" "${LSP_FOLDER}"
		else
			ASSET_TO_COPY="${TMP_UNZIPPED_FOLDER}"
			cp "${ASSET_TO_COPY}" "${LSP_FOLDER}/${e}"
			ASSET_TO_COPY="${e}"
		fi

		ASSET_NAME=$(basename -- "$ASSET_TO_COPY")
		log_debug "chmod +x: ${ASSET_NAME}"
		chmod +x "${LSP_FOLDER}/${ASSET_NAME}"

		log_info "Binary copied to lsp folder: ${ASSET_NAME}"
	done

	rm "${TMP_UNZIPPED_FOLDER}" -r

}

# download a vscode extensions an"d copy the subpath to lsp-folder
function download_extension() {
	URL=$1
	COMPRESSION=$2
	EXTENSION=$3
	SUBPATH=(${4})
	CHMOD=(${5})

	unset TMP_DOWNLOAD_PATH
	unset TMP_UNZIPPED_FOLDER
	unset PARSED_SUBPATHS

	TMP_DOWNLOAD_PATH="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"
	TMP_UNZIPPED_FOLDER="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"

	log_start "Downloading extension: $EXTENSION from $URL" "top"

	fetch_url "${URL}" "${TMP_DOWNLOAD_PATH}"

	extract_archive "${TMP_DOWNLOAD_PATH}" "${TMP_UNZIPPED_FOLDER}" "${COMPRESSION}"

	if [ -d "${LSP_FOLDER}/${EXTENSION}" ] || [ -f "${LSP_FOLDER}/${EXTENSION}" ]; then
		log_debug "Root for extension already found, removing: ${EXTENSION}"
		rm "${LSP_FOLDER}/${EXTENSION}" -r
	fi

	if [ "${#SUBPATH[@]}" -eq 0 ]; then
		SUBPATH=('.')
		log_debug "Using root path for extension: ${EXTENSION}"
	fi

	PARSED_SUBPATHS=()

	for e in "${SUBPATH[@]}"; do
		PARSED_SUBPATHS+=("${TMP_UNZIPPED_FOLDER}/${e}")
	done

	if [ "${#PARSED_SUBPATHS[@]}" -gt 1 ]; then
		mkdir -p "${LSP_FOLDER}/${EXTENSION}"
		log_debug "Multiple subpaths will be created for extension: ${EXTENSION}"
	fi

	eval "mv -v ${PARSED_SUBPATHS[*]} ${LSP_FOLDER}/${EXTENSION}/"

	log_info "Added extension: ${EXTENSION}"

	for e in "${CHMOD[@]}"; do
		log_debug "chmod +x -R: ${EXTENSION}/${e}"
		chmod +x -R "${LSP_FOLDER}/${EXTENSION}/${e}"
	done
}

# gets the latest release from the github releases
function get_latest_release() {
	curl --silent "https://api.github.com/repos/$1/releases/latest" \
		|
		# Get latest release from GitHub api
		grep '"tag_name":' \
		|
		# Get tag line
		sed -E 's/.*"([^"]+)".*/\1/' # Pluck JSON value
}

function pluck_v_from_release() {
	echo "$1" \
		| sed -E 's/v//'
}

## for npm based extensions
install_and_link_binaries "node" "${NPM_EXTENSIONS[*]}"

## for go based extensions
install_and_link_binaries "go" "${GO_EXTENSIONS[*]}"

## for python based extensions
log_start "Initiating new python environment." "top"
python3 -m venv ./venv
./venv/bin/pip3 install -U pip
log_finish "Now in new python environment."

install_and_link_binaries "python" "${PYTHON_EXTENSIONS[*]}"

## install custom stuff with curl, for compiled binaries mostly

log_start "Installing custom assets and vscode-extensions..." "top"

# install shell-check here
VERSION="$(get_latest_release koalaman/shellcheck)"
download_binary "https://github.com/koalaman/shellcheck/releases/download/${VERSION}/shellcheck-${VERSION}.linux.x86_64.tar.xz" "tar_xz" "shellcheck-${VERSION}/shellcheck"

# install lua language server
VERSION="$(pluck_v_from_release $(get_latest_release "sumneko/vscode-lua"))"
download_extension "https://github.com/sumneko/vscode-lua/releases/download/v$VERSION/lua-$VERSION.vsix" "zip" "lua-language-server" "extension/server" "bin"

# install eslint language server, dont upgrade this until figuring out how to accept the prompt
VERSION="2.1.0"
download_extension "https://github.com/microsoft/vscode-eslint/releases/download/release%2F$VERSION-next.1/vscode-eslint-$VERSION.vsix" "zip" "eslint-language-server" "extension/server/out"
# VERSION="2.1.8"
# download_extension "https://github.com/microsoft/vscode-eslint/releases/download/release%2F$VERSION/dbaeumer.vscode-eslint-$VERSION.vsix" "zip" "eslint-language-server" "extension/server/out"

# install tailwinds language server
VERSION="$(pluck_v_from_release $(get_latest_release tailwindlabs/tailwindcss-intellisense))"
download_extension "https://github.com/tailwindlabs/tailwindcss-intellisense/releases/download/v$VERSION/vscode-tailwindcss-$VERSION.vsix" "zip" "tailwindcss-language-server" "extension/dist/server"

# install hadolint language server
VERSION="$(get_latest_release hadolint/hadolint)"
download_binary "https://github.com/hadolint/hadolint/releases/download/$VERSION/hadolint-Linux-x86_64" "none" "hadolint"

# rust analyzer
VERSION="nightly"
download_binary "https://github.com/rust-analyzer/rust-analyzer/releases/download/$VERSION/rust-analyzer-linux" "none" "rust-analyzer"

# downloading vscode internal extensions
EXTENSIONS_BASE_PATH="VSCode-linux-x64/resources/app/extensions"
download_extension "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64" "tar_gz" "vscode" "${EXTENSIONS_BASE_PATH}/json-language-features ${EXTENSIONS_BASE_PATH}/css-language-features ${EXTENSIONS_BASE_PATH}/html-language-features"

log_finish "Installed custom assets and vscode-extensions." "top"

## goodbye
log_finish "Installed lsp dependencies in $((SECONDS / 60)) minutes and $((SECONDS % 60)) seconds." "top"
