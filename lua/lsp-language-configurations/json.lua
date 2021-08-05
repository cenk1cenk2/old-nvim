-- npm install -g vscode-json-languageserver
local lsphelpers = require('helper-functions.lsp')

require('lspconfig').jsonls.setup({
  cmd = {'node', vim.g.lsp_servers_dir .. 'vscode/json-language-features/server/dist/node/jsonServerMain.js', '--stdio'},
  filetypes = {'json', 'jsonc'},
  on_attach = function(client)
    lsphelpers.disable_formatting(client)

    lsphelpers.on_attach_illuminate(client)
  end,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line('$'), 0})
      end
    }
  },
  settings = {
    json = {
      schemas = {
        {fileMatch = {'package.json'}, url = 'https://json.schemastore.org/package.json'},
        {fileMatch = {'tsconfig*.json', 'tsconfig.json', 'tsconfig.build.json'}, url = 'https://json.schemastore.org/tsconfig.json'},
        {fileMatch = {'.prettierrc', '.prettierrc.json'}, url = 'https://json.schemastore.org/prettierrc.json'},
        {fileMatch = {'.eslintrc', '.eslintrc.json'}, url = 'https://json.schemastore.org/eslintrc.json'},
        {fileMatch = {'.babelrc', '.babelrc.json'}, url = 'https://json.schemastore.org/babelrc.json'},
        {fileMatch = {'lerna.json'}, url = 'https://json.schemastore.org/lerna.json'}
      }
    }
  }
})

local helpers = require('helper-functions')

helpers.autocommand.define_augroups({
  JsonSetFileTypes = {{'BufNewFile,BufRead', '.prettierrc', 'set ft=json'}, {'BufNewFile,BufRead', '.eslintrc', 'set ft=json'}, {'BufNewFile,BufRead', '.babelrc', 'set ft=json'}}
})
