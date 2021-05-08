local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig.util')
local lsphelpers = require('helper-functions.lsp')

-- Check if it's already defined for when reloading this file.
configs.eslint = {
  default_config = {
    cmd = {'node', vim.g.lsp_servers_dir .. 'eslint-language-server/eslintServer.js', '--stdio'},
    filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue'},
    on_attach = function(client)
      lsphelpers.disable_formatting(client)
    end,
    root_dir = function(fname)
      return util.root_pattern('tsconfig.json')(fname) or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
    end,
    settings = {
      validate = 'probe',
      nodePath = vim.g.lsp_servers_dir .. 'node_modules',
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

lspconfig.eslint.setup({})
