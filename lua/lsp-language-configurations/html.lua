-- npm install -g vscode-html-languageserver-bin
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {cmd = {vim.g.lsp_servers_dir .. 'html-languageserver', '--stdio'}, capabilities = capabilities}
