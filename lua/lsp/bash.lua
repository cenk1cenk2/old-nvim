-- npm i -g bash-language-server
require'lspconfig'.bashls.setup{
  cmd = {vim.g.lsp_settings_servers_dir .. 'bash-language-server', 'start'},
}
