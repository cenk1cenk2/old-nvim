-- npm install -g vls
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').vuels.setup({
  on_attach = function(client)
    lsphelpers.disable_formatting(client)
    lsphelpers.on_attach_illuminate(client)
  end,
  cmd = {vim.g.lsp_servers_dir .. 'vls', '--stdio', '--debug'},
  settings = {vetur = {experimental = {templateInterpolationService = true}}}

  -- handlers = {
  --   ['tailwindcss/getConfiguration'] = function(_, _, params, _, bufnr, _)
  --     -- tailwindcss lang server waits for this response before providing hover
  --     vim.lsp.buf_notify(bufnr, 'tailwindcss/getConfigurationResponse', {_id = params._id})
  --   end
  -- }
})
