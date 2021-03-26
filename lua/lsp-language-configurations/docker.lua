-- npm install -g dockerfile-language-server-nodejs
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').dockerls.setup {
  on_attach = function(client)
    lsphelpers.auto_format_if_capable(client)
  end,
  cmd = {'node', vim.g.lsp_servers_dir .. 'docker-langserver', '--stdio'}
}

