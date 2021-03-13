-- npm install -g graphql-language-service-cli
require('lspconfig').graphql.setup {cmd = {vim.g.lsp_settings_servers_dir .. 'graphql-lsp', 'server', '-m', 'stream'}}
