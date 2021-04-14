-- npm install -g stylelint-lsp
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').stylelint_lsp.setup({
  cmd = {vim.g.lsp_servers_dir .. 'stylelint-lsp', '--stdio'},

  on_attach = function(client)
    lsphelpers.disable_formatting(client)
  end
})
