-- npm install -g vim-language-server
require('lspconfig').vimls.setup {cmd = {vim.g.lsp_servers_dir .. 'vim-language-server', '--stdio'}}
