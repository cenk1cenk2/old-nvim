-- npm install -g dockerfile-language-server-nodejs
local lsphelpers = require 'lsp-helpers'

require('lspconfig').dockerls.setup {
  on_attach = function(client)
    lsphelpers.auto_format_if_capable(client)
  end,
  cmd = {vim.g.lsp_settings_servers_dir .. 'docker-langserver', '--stdio'}
}

