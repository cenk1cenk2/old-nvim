-- npm install -g vscode-css-languageserver-bin
require('lspconfig').cssls.setup({
  cmd = {'node', vim.g.lsp_servers_dir .. 'vscode/css-language-features/server/dist/node/cssServerMain.js', '--stdio'},
  filetypes = {'css', 'less', 'scss', 'typescriptreact', 'javascriptreact'}
})
