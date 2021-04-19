local lsphelpers = require('helper-functions.lsp')
local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities = lsphelpers.create_capabilities({snippets = true}),
  on_attach = function(client, bufnr)
    require('illuminate').on_attach(client)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
})
