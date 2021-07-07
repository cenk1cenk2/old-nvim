local efm = require('lsp-language-configurations.efm-configurations.init')
local lsphelpers = require('helper-functions.lsp')

local languages = {
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
  ['yaml.*'] = {efm.prettier},
  json = {efm.prettier},
  jsonc = {efm.prettier},
  html = {efm.prettier},
  scss = {efm.prettier},
  css = {efm.prettier},
  markdown = {efm.prettier, efm.markdownlint, efm.misspell}
}

-- https://github.com/mattn/efm-langserver
require('lspconfig').efm.setup {
  cmd = {vim.g.lsp_servers_dir .. 'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '1'},
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true

    lsphelpers.auto_format_if_capable(client, {
      '*.sh',
      '*.lua',
      '*.go',
      '*.py',
      '*.ts',
      '*.tsx',
      '*.js',
      '*.jsx',
      '*.vue',
      '*.yml',
      '*.yml.j2',
      '*.yaml',
      '*.yaml.j2',
      '*.json',
      '*.json5',
      '*.html',
      '*.scss',
      '*.css',
      '*.md'
    })
  end,
  init_options = {documentFormatting = true, codeAction = true, completion = true},
  root_dir = require('lspconfig').util.root_pattern('package.json', '.git', vim.fn.getcwd()),
  filetypes = vim.tbl_keys(languages),
  settings = {rootMarkers = {'package.json', '.git/'}, lintDebounce = 500, languages = languages}
}
