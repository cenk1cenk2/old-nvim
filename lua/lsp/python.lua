-- npm i -g pyright
require('lspconfig').pyright.setup {cmd = {vim.g.lsp_settings_servers_dir .. 'pyright-langserver', '--stdio'}}
