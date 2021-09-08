vim.lsp.handlers['textDocument/publishDiagnostics'] = function(_, _, params, client_id, _, config)
  local uri = params.uri
  local bufnr = vim.uri_to_bufnr(uri)

  if not bufnr then return end

  local diagnostics = params.diagnostics

  vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

  if not vim.api.nvim_buf_is_loaded(bufnr) then return end

  -- don't mutate the original diagnostic because it would interfere with
  -- code action (and probably other stuff, too)
  local prefixed_diagnostics = vim.deepcopy(diagnostics)

  for i, v in pairs(diagnostics) do prefixed_diagnostics[i].message = string.format('%s: %s', v.source, v.message) end

  vim.lsp.diagnostic.display(prefixed_diagnostics, bufnr, client_id, {
    -- Disable underline, it's very annoying
    underline = false,
    -- Enable virtual text, override spacing to 4
    virtual_text = {spacing = 4},
    signs = true,
    update_in_insert = false
  })
end

