local lsphelpers = require('helper-functions.lsp')
local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities = lsphelpers.create_capabilities({snippets = true}),
  on_attach = function(client)
    require('illuminate').on_attach(client)
  end
})