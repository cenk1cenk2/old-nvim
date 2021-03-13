-- npm install -g typescript typescript-language-server
require('lspconfig').tsserver.setup {
  cmd = {vim.g.lsp_settings_servers_dir .. 'typescript-language-server', '--stdio'},
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
  init_options = {documentFormatting = false},
  commands = {
    TypescriptOrganizeImports = {
      function()
        local params = {command = '_typescript.organizeImports', arguments = {vim.api.nvim_buf_get_name(0)}, title = ''}
        vim.lsp.buf.execute_command(params)
      end
    },

    TypescriptRenameFile = {
      function()
        local newName = vim.api.nvim_input()
        local params = {command = '_typescript.applyRenameFile', arguments = {vim.api.nvim_buf_get_name(0), name}, title = ''}
        vim.lsp.buf.execute_command(params)
      end
    }
  }
}

