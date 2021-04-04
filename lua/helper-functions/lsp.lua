local lsphelpers = {}
local autocommandhelper = require('helper-functions.autocommand')

function lsphelpers.auto_format_if_capable(client)
  if client.resolved_capabilities.document_formatting then autocommandhelper.define_augroups({Format = {{'BufWritePost', '<buffer>', 'LspFormattingSync'}}}) end
end

function lsphelpers.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

function lsphelpers.create_capabilities(add)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  if add.snippets == true then capabilities.textDocument.completion.completionItem.snippetSupport = true end

  return capabilities
end

return lsphelpers
