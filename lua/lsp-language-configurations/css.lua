-- npm install -g vscode-css-languageserver-bin
require('lspconfig').cssls.setup {cmd = {vim.g.lsp_servers_dir .. 'css-languageserver', '--stdio'}}
