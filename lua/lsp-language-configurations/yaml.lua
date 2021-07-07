-- npm install -g yaml-language-server
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').yamlls.setup({
  cmd = {vim.g.lsp_servers_dir .. 'yaml-language-server', '--stdio'},
  on_attach = function(client)
    lsphelpers.disable_formatting(client)

    lsphelpers.on_attach_illuminate(client)
  end,
  filetypes = {'yaml', 'yaml.*'},
  settings = {
    yaml = {
      schemas = {
        ['https://json.schemastore.org/gitlab-ci.json'] = {'.gitlab-ci.yml'},
        ['https://json.schemastore.org/drone.json'] = {'.drone.yml'},
        ['https://json.schemastore.org/ansible-playbook.json'] = {'deploy.yml', 'provision.yml'}
      }
    }
  }
})
