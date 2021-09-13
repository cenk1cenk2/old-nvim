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
      schemas = vim.tbl_extend('keep', {
        {fileMatch = {'package.json'}, url = 'http://json.schemastore.org/package.json'},
        {fileMatch = {'tsconfig*.json', 'tsconfig.json', 'tsconfig.build.json'}, url = 'http://json.schemastore.org/tsconfig.json'},
        {fileMatch = {'.prettierrc', '.prettierrc.json'}, url = 'http://json.schemastore.org/prettierrc.json'},
        {fileMatch = {'.eslintrc', '.eslintrc.json'}, url = 'http://json.schemastore.org/eslintrc.json'},
        {fileMatch = {'.babelrc', '.babelrc.json'}, url = 'http://json.schemastore.org/babelrc.json'},
        {fileMatch = {'lerna.json'}, url = 'http://json.schemastore.org/lerna.json'}
      }, require('nlspsettings.jsonls').get_default_schemas())
    }
  }
})

local helpers = require('helper-functions')

helpers.autocommand.define_augroups({
  JsonSetFileTypes = {{'BufNewFile,BufRead', '.prettierrc', 'set ft=json'}, {'BufNewFile,BufRead', '.eslintrc', 'set ft=json'}, {'BufNewFile,BufRead', '.babelrc', 'set ft=json'}}
})
