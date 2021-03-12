#!/bin/bash

LSP_FOLDER=~/.config/nvim/lsp-servers
NPM_EXTENSIONS=(
  "typescript;tsserver"
  "typescript-language-server"
  "eslint_d"
  "prettier"
  "vscode-json-languageserver"
  "vim-language-server"
)
GO_EXTENSIONS=(
  "github.com/mattn/efm-langserver@latest"
)
PYTHON_EXTENSIONS=(
  "vim-vint;vint"
)

echo "LSP Folder: ${LSP_FOLDER}"
mkdir -p ${LSP_FOLDER}
cd ${LSP_FOLDER}

function split_string() {
  unset PACKAGE_NAME
  unset BIN_NAME
  i=0
  for data in $(echo $1 | tr ";" "\n"); do
    if [ $i -eq 0 ]; then
      PACKAGE_NAME=$data
    elif [ $i -eq 1 ]; then
      BIN_NAME=$data
    fi
    i=$(($i + 1))
  done

  if [ -z $BIN_NAME ]; then
    BIN_NAME=$PACKAGE_NAME
  fi
}

# for npm based extensions
ALL_NPM_EXTENSIONS=()
ALL_NPM_BINARIES=()
for e in "${NPM_EXTENSIONS[@]}"; do
  split_string ${e}
  ALL_NPM_EXTENSIONS+=("${PACKAGE_NAME}")
  ALL_NPM_BINARIES+=("${BIN_NAME}")
done
echo "Installing NPM packages: ${ALL_NPM_EXTENSIONS[@]}"

if [ ${#ALL_NPM_EXTENSIONS[@]} -gt 0 ]; then
  yarn add ${ALL_NPM_EXTENSIONS[@]} --prod

  echo "Linking NPM binaries: ${ALL_NPM_BINARIES[@]}"
  for e in "${ALL_NPM_BINARIES[@]}"; do
    if [[ -L "$e" && -f "$e" ]]; then
      rm ${e}
    fi
    ln -s "./node_modules/.bin/${e}" .
  done
else
  echo "No NPM extensions. Skipping..."
fi

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

if [ ${#ALL_PYTHON_EXTENSIONS[@]} -gt 0 ]; then
  echo "Installing Python package: ${ALL_PYTHON_EXTENSIONS[@]}"
  ./venv/bin/pip3 install ${ALL_PYTHON_EXTENSIONS[@]}

  echo "Linking Python binaries: ${ALL_PYTHON_BINARIES[@]}"
  for e in "${ALL_PYTHON_BINARIES[@]}"; do
    if [[ -L "$e" && -f "$e" ]]; then
      rm ${e}
    fi
    ln -s "./venv/bin/${e}" .
  done
else
  echo "No Python extensions. Skipping..."
fi
