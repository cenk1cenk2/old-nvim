-- npm install -g yaml-language-server
require('lspconfig').yamlls.setup {cmd = {vim.g.lsp_servers_dir .. 'yaml-language-server', '--stdio'}}
