local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')
local lsphelpers = require('helper-functions/lsp')

-- Check if it's already defined for when reloading this file.
if not lspconfig.grammarly then
  local capabilities = lsphelpers.create_capabilities({snippets = false})

  configs.grammarly = {
    default_config = {
      cmd = {vim.g.lsp_servers_dir .. 'unofficial-grammarly-language-server', '--stdio'},
      filetypes = {'=', 'markdown'},
      capabilities = capabilities,
      root_dir = function(fname)
        return util.root_pattern('.git')(fname)
      end,
      settings = {grammarly = {autoActivate = true, debug = true}},
      on_attach = function()
      end
      -- handlers = {}
    }
  }
end

lspconfig.grammarly.setup({})
