-- npm install -g typescript typescript-language-server
local lsphelpers = require('lsp-helpers')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').tsserver.setup {
  cmd = {vim.g.lsp_settings_servers_dir .. 'typescript-language-server', '--stdio', '--log-level', '4'},
  capabilities = capabilities,
  on_attach = function(client)
    lsphelpers.disable_formatting(client)
  end,
  init_options = {documentFormatting = false},
  commands = {
    LspOrganizeImports = {
      function()
        vim.lsp.buf.execute_command({command = '_typescript.organizeImports', arguments = {vim.api.nvim_buf_get_name(0)}, title = ''})
      end
    },

    LspRenameFile = {
      function()
        vim.call('inputsave')

        local current = vim.api.nvim_buf_get_name(0)
        local rename = vim.call('input', 'Set the path to rename to > ', current)

        print('\n')
        print('Renaming:' .. current .. ' -> ' .. rename)

        vim.lsp.buf.execute_command({command = '_typescript.applyRenameFile', arguments = {{sourceUri = 'file://' .. current, targetUri = 'file://' .. rename}}, title = ''})

        vim.call('inputrestore')
      end
    }
  }
}

