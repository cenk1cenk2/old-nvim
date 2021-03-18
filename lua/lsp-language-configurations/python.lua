-- npm i -g pyright
require('lspconfig').pyright.setup {cmd = {vim.g.lsp_servers_dir .. 'pyright-langserver', '--stdio'}}
