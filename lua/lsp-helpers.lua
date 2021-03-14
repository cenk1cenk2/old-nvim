local lsphelpers = {}

function lsphelpers.auto_format_if_capable(client)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> LspFormatting]]
    vim.api.nvim_command [[augroup END]]
  end
end

function lsphelpers.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

return lsphelpers
