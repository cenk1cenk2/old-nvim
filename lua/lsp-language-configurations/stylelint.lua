-- npm install -g stylelint-lsp
require('lspconfig').stylelint_lsp.setup {cmd = {vim.g.lsp_servers_dir .. 'stylelint-lsp', '--stdio'}}
