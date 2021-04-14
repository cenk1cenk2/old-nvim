-- npm install -g vls
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').vuels.setup({
  on_attach = function(client)
    lsphelpers.disable_formatting(client)
    lsphelpers.on_attach_illuminate(client)
  end,
  cmd = {vim.g.lsp_servers_dir .. 'vls', '--stdio'}
})
