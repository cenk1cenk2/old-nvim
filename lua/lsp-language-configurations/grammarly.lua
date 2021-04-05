local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

-- Check if it's already defined for when reloading this file.
if not lspconfig.grammarly then
  configs.grammarly = {
    default_config = {
      cmd = {'node', vim.g.lsp_servers_dir .. 'unofficial-grammarly-language-server', '--stdio'},
      filetypes = {'=', 'markdown'},
      root_dir = function(fname)
        return util.root_pattern('.git')(fname)
      end,
      log_level = vim.lsp.protocol.MessageType.Info,
      settings = {autoActivate = true, debug = true}
      -- handlers = {}
    }
  }
end

lspconfig.grammarly.setup({})
