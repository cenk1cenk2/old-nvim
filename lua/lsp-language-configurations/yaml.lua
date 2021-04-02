-- npm install -g yaml-language-server
require('lspconfig').yamlls.setup {
  cmd = {vim.g.lsp_servers_dir .. 'yaml-language-server', '--stdio'},
  settings = {
    yaml = {
      schemas = {
        ['https://json.schemastore.org/gitlab-ci.json'] = {'.gitlab-ci.yml'},
        ['https://json.schemastore.org/drone.json'] = {'.drone.yml'},
        ['https://json.schemastore.org/ansible-playbook.json'] = {'deploy.yml', 'provision.yml'}
      }
    }
  }
}
