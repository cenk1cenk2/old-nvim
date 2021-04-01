local lsphelpers = {}

function lsphelpers.auto_format_if_capable(client)
  if client.resolved_capabilities.document_formatting then
    print('Autoformat supported for ➜ ' .. client.name)
    vim.api.nvim_command([[ augroup AutoFormatStuff ]])
    vim.api.nvim_command([[ autocmd! * <buffer> ]])
    vim.api.nvim_command([[ autocmd BufWritePre <buffer> LspFormattingSync ]])
    vim.api.nvim_command([[ augroup END ]])
  end
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
