#!/bin/bash

EXTENSIONS="typescript typescript-language-server vscode-json-languageserver"

echo "Installing LSPs..."

mkdir -p ~/.config/nvim/lsp
cd ~/.config/nvim/lsp

sudo yarn global add --force --prod ${EXTENSIONS}
