-- npm i -g pyright
-- local lsphelpers = require('helper-functions.lsp')
require('lspconfig').pyright.setup({
  cmd = {vim.g.lsp_servers_dir .. 'pyright-langserver', '--stdio'},
  on_attach = function(_)

  end
})
