-- https://github.com/golang/tools/tree/master/gopls
require('lspconfig').tsserver.setup{
  cmd = {vim.g.lsp_settings_servers_dir .. 'gopls'},
}

