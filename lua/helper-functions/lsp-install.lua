local M = {}

M.header = [[
SECONDS=0

## inject logger
LOG_LEVEL=${LOG_LEVEL-"INFO"}
source <(curl -s "https://gist.githubusercontent.com/cenk1cenk2/e03d8610534a9c78f755c1c1ed93a293/raw/3d61dc3718f3a3687d5990b9b5dc951198d29427/logger.sh")
]] .. [[

# lsp folder
LSP_FOLDER=]] .. vim.g.lsp_servers_dir .. [[

log_this "${LSP_FOLDER}" "${MAGENTA}LSP-FOLDER${RESET}" "lifetime"

mkdir -p ${LSP_FOLDER}
cd ${LSP_FOLDER} || exit 127
]]

M.footer = [[
## goodbye
log_finish "Installed lsp dependencies in $((SECONDS / 60)) minutes and $((SECONDS % 60)) seconds." "top"
]]

M.package_manager_functions = [[
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
		INSTALL_COMMAND="GOPATH=$(pwd) GOBIN=$(pwd) GO111MODULE=on go get -v"
		CLEAN_COMMAND=("GOPATH=$(pwd) GO111MODULE=on go clean -modcache" "rm -rf src pkg 2>/dev/null")
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

		eval "${INSTALL_COMMAND} ${ALL_EXTENSIONS[*]}"

		if [ -n "${BASE_DIR}" ]; then
			log_info "Linking binaries: ${ALL_BINARIES[*]}"

			for e in "${ALL_BINARIES[@]}"; do
				if [ -L "$LSP_FOLDER/$e" ]; then
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
]]

M.fetch_functions = [[
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
	else
		log_error "Unknown archive type: ${COMPRESSION}"
		exit 127
	fi

	if [ $? -gt 0 ]; then
		log_error "Unzipping unsuccesfull: ${TMP_DOWNLOAD_PATH} as ${COMPRESSION}"
		exit 127
	fi
}
]]

M.download_binary_functions = M.fetch_functions .. [[
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
		ASSET_TO_COPY="${TMP_UNZIPPED_FOLDER}/${e}"
		cp "${ASSET_TO_COPY}" "${LSP_FOLDER}"

		ASSET_NAME=$(basename -- "$ASSET_TO_COPY")
		log_debug "chmod +x: ${ASSET_NAME}"
		chmod +x "${LSP_FOLDER}/${ASSET_NAME}"

		log_info "Binary copied to lsp folder: ${ASSET_NAME}"
	done

	rm "${TMP_UNZIPPED_FOLDER}" -r

}
]]

M.download_extension_functions = M.fetch_functions .. [[
# download a vscode extensions and copy the subpath to lsp-folder
function download_extension() {
	URL=$1
	COMPRESSION=$2
	EXTENSION=$3
	SUBPATH=$4
	CHMOD=(${5})

	unset TMP_DOWNLOAD_PATH
	unset TMP_UNZIPPED_FOLDER

	TMP_DOWNLOAD_PATH="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"
	TMP_UNZIPPED_FOLDER="/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"

	log_start "Downloading extension: $EXTENSION from $URL" "top"

	fetch_url "${URL}" "${TMP_DOWNLOAD_PATH}"

	extract_archive "${TMP_DOWNLOAD_PATH}" "${TMP_UNZIPPED_FOLDER}" "${COMPRESSION}"

	if [ -d "${LSP_FOLDER}/${EXTENSION}" ] || [ -f "${LSP_FOLDER}/${EXTENSION}" ]; then
		log_debug "Root for extension already found, removing: ${EXTENSION}"
		rm "${LSP_FOLDER}/${EXTENSION}" -r
	fi

	mv "${TMP_UNZIPPED_FOLDER}/${SUBPATH:-'.'}/" "${LSP_FOLDER}/${EXTENSION}"

	log_info "Added extension: ${EXTENSION}"

	for e in "${CHMOD[@]}"; do
		log_debug "chmod +x -R: ${EXTENSION}/${e}"
		chmod +x -R "${LSP_FOLDER}/${EXTENSION}/${e}"
	done
}
]]

M.install_vscode_extension = function(url, extension, subpath, chmod)
  local script = M.header .. M.download_extension_functions .. [[
download_extension ]] .. ' "' .. url .. '" "' .. 'zip' .. '" "' .. extension .. '" "' .. subpath .. '"'

  if chmod then script = script .. ' "' .. chmod .. '"' end

  script = script .. M.footer

  return script
end

return M
