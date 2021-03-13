local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

-- Check if it's already defined for when reloading this file.
if not lspconfig.eslint then
  configs.eslint = {
    default_config = {
      cmd = {'node', vim.g.lsp_settings_servers_dir .. 'eslint-language-server/eslintServer.js', '--stdio'},
      filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue'},
      root_dir = function(fname)
        return util.root_pattern('tsconfig.json')(fname) or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
      end,
      settings = {
        validate = 'probe',
        nodePath = vim.g.lsp_settings_servers_dir .. 'node_modules',
        run = 'onType',
        codeAction = {disableRuleComment = {enable = true, location = 'seperateLine'}, showDocumentation = {enable = true}},
        format = false,
        quiet = false,
        onIgnoredFiles = 'off',
        options = {},
        codeActionOnSave = {enable = true, mode = 'all'}
      }
    }
  }
end

lspconfig.eslint.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
}
