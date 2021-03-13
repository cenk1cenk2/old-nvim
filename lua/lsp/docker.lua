-- npm install -g dockerfile-language-server-nodejs
local lspwrapper = require "lsp-wrapper"

require('lspconfig').dockerls.setup{
  on_attach = function(client)
    lspwrapper.auto_format_if_capable(client)
  end,
  cmd = {vim.g.lsp_settings_servers_dir .. 'docker-langserver', '--stdio'},
}

