-- npm install -g vim-language-server
require('lspconfig').vimls.setup {cmd = {vim.g.lsp_settings_servers_dir .. 'vim-language-server', '--stdio'}}
