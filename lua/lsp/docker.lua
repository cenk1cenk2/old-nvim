-- npm install -g dockerfile-language-server-nodejs
require('lspconfig').dockerls.setup{
  cmd = {vim.g.lsp_settings_servers_dir .. 'docker-langserver', '--stdio'},
}

