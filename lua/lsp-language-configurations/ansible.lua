-- npm install -g dockerfile-language-server-nodejs
local lsphelpers = require('helper-functions.lsp')
local util = require('lspconfig.util')

require('lspconfig').ansiblels.setup {
  filetypes = {'yaml'},
  root_dir = function(fname)
    return util.root_pattern {'.ansible-lint', '.vault-password', 'group_vars', 'host_vars', 'config/group_vars', 'config/host_vars'}(fname)
  end,
  cmd = {vim.g.lsp_servers_dir .. 'ansible-language-server', '--stdio'},
  settings = {ansible = {ansible = {path = 'ansible'}, ansibleLint = {enabled = true, path = 'ansible-lint'}, python = {interpreterPath = 'python3'}}}
}

