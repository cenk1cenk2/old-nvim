-- npm install -g vscode-json-languageserver
require('lspconfig').jsonls.setup {
  cmd = {vim.g.lsp_servers_dir .. 'vscode-json-languageserver', '--stdio'},
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line('$'), 0})
      end
    }
  }
}
