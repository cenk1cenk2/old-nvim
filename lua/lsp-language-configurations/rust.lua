-- npm install -g stylelint-lsp
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').rust_analyzer.setup({
  cmd = {vim.g.lsp_servers_dir .. '/rust-analyzer'},
  on_attach = function(client)
    -- lsphelpers.disable_formatting(client)

    lsphelpers.on_attach_illuminate(client)

    lsphelpers.auto_format_if_capable(client, {'*.rs'})
  end
})
