local efm = require('lsp-language-configurations.efm-configurations.init')
local lsphelpers = require('helper-functions.lsp')

-- https://github.com/mattn/efm-langserver
require('lspconfig').efm.setup {
  cmd = {vim.g.lsp_servers_dir .. 'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '1'},
  on_attach = function(client)
    lsphelpers.auto_format_if_capable(client)
  end,
  init_options = {documentFormatting = true, codeAction = true, completion = true},
  filetypes = {
    '=',
    'sh',
    'vim',
    'lua',
    'go',
    'dockerfile',
    'python',
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
    'yaml',
    'json',
    'jsonc',
    'html',
    'scss',
    'css',
    'markdown'
  },
  settings = {
    rootMarkers = {'package.json', '.git/'},
    lintDebounce = 500,
    languages = {
      ['='] = {efm.misspell},
      sh = {efm.shfmt, efm.shellcheck},
      vim = {efm.vint},
      lua = {efm.luafmt},
      go = {efm.golint, efm.goimports},
      dockerfile = {efm.docker_hadolint},
      python = {efm.black, efm.isort, efm.flake8, efm.mypy},
      typescript = {efm.prettier, efm.eslint},
      javascript = {efm.prettier, efm.eslint},
      typescriptreact = {efm.prettier, efm.eslint},
      javascriptreact = {efm.prettier, efm.eslint},
      vue = {efm.prettier, efm.eslint},
      yaml = {efm.prettier},
      json = {efm.prettier},
      html = {efm.prettier},
      scss = {efm.prettier},
      css = {efm.prettier},
      markdown = {efm.prettier, efm.markdownlint, efm.misspell}
    }
  }
}
