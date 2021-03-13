-- npm install -g yaml-language-server
require('lspconfig').yamlls.setup {cmd = {vim.g.lsp_settings_servers_dir .. 'yaml-language-server', '--stdio'}}
