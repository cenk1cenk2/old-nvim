-- https://github.com/golang/tools/tree/master/gopls
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').gopls.setup({
  cmd = {vim.g.lsp_servers_dir .. 'gopls'},
  on_attach = function(client)
    lsphelpers.disable_formatting(client)

    lsphelpers.on_attach_illuminate(client)
  end
})
