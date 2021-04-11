-- npm install -g typescript typescript-language-server
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').tsserver.setup {
  cmd = {vim.g.lsp_servers_dir .. 'typescript-language-server', '--stdio', '--log-level', '4'},
  on_attach = function(client)
    lsphelpers.disable_formatting(client)
    lsphelpers.on_attach_illuminate(client)

    require('nvim-lsp-ts-utils').setup {
      -- defaults
      disable_commands = false,
      enable_import_on_completion = false
    }
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
        local rename = vim.fn.input('Set the path to rename to' .. ' ➜ ', current)

        vim.api.nvim_command('normal :esc<CR>')

        vim.api.nvim_out_write(current .. ' ➜ ' .. rename .. '\n')

        vim.lsp.buf.execute_command({command = '_typescript.applyRenameFile', arguments = {{sourceUri = 'file://' .. current, targetUri = 'file://' .. rename}}, title = ''})

        vim.loop.fs_rename(current, rename)

        for _, buf in pairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) then
            if vim.api.nvim_buf_get_name(buf) == current then
              vim.api.nvim_buf_set_name(buf, rename)
              -- to avoid the 'overwrite existing file' error message on write
              vim.api.nvim_buf_call(buf, function()
                vim.cmd('silent! w!')
              end)
            end
          end
        end

        vim.call('inputrestore')
      end
    }
  }
}

