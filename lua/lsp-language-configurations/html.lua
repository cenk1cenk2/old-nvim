-- npm install -g vscode-html-languageserver-bin
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  cmd = {'node', vim.g.lsp_servers_dir .. 'vs-code/html-language-features/server/dist/node/htmlServerMain.js', '--stdio'},
  capabilities = capabilities,
  -- init_options = {provideFormatter = true},
  filetypes = {
    -- html
    'aspnetcorerazor',
    'blade',
    'django-html',
    'edge',
    'ejs',
    'erb',
    'gohtml',
    'haml',
    'handlebars',
    'hbs',
    'html',
    'html-eex',
    'jade',
    'leaf',
    'liquid',
    'markdown',
    'mdx',
    'mustache',
    'njk',
    'nunjucks',
    'php',
    'razor',
    'slim',
    'twig',
    -- mixed
    'vue',
    'svelte'
  }
}
