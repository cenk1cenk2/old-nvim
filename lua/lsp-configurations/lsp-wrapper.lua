local lsp_wrapper = {}
-- buf

function lsp_wrapper.add_to_workspace_folder()
  vim.lsp.buf.add_workspace_folder()
end

function lsp_wrapper.clear_references()
  vim.lsp.buf.clear_references()
end

function lsp_wrapper.code_action()
  vim.lsp.buf.code_action()
end

function lsp_wrapper.declaration()
  vim.lsp.buf.declaration()
  vim.lsp.buf.clear_references()
end

function lsp_wrapper.definition()
  vim.lsp.buf.definition()
  vim.lsp.buf.clear_references()
end

function lsp_wrapper.document_highlight()
  vim.lsp.buf.document_highlight()
end

function lsp_wrapper.document_symbol()
  vim.lsp.buf.document_symbol()
end

function lsp_wrapper.formatting()
  vim.lsp.buf.formatting()
end

function lsp_wrapper.formatting_sync()
  vim.lsp.buf.formatting_sync(nil, 3000)
end

function lsp_wrapper.hover()
  -- vim.lsp.buf.hover()
  require('lspsaga.hover').render_hover_doc()
end

function lsp_wrapper.implementation()
  vim.lsp.buf.implementation()
end

function lsp_wrapper.incoming_calls()
  vim.lsp.buf.incoming_calls()
end

function lsp_wrapper.list_workspace_folders()
  vim.lsp.buf.list_workspace_folders()
end

function lsp_wrapper.outgoing_calls()
  vim.lsp.buf.outgoing_calls()
end

function lsp_wrapper.range_code_action()
  vim.lsp.buf.range_code_action()
end

function lsp_wrapper.range_formatting()
  vim.lsp.buf.range_formatting()
end

function lsp_wrapper.references()
  -- vim.lsp.buf.references()
  require('telescope.builtin').lsp_references()
  vim.lsp.buf.clear_references()
end

function lsp_wrapper.remove_workspace_folder()
  vim.lsp.buf.remove_workspace_folder()
end

function lsp_wrapper.rename()
  -- vim.lsp.buf.rename()
  require('lspsaga.rename').rename()
end

function lsp_wrapper.signature_help()
  -- vim.lsp.buf.signature_help()
  require('lspsaga.signaturehelp').signature_help()
end

function lsp_wrapper.type_definition()
  vim.lsp.buf.type_definition()
end

function lsp_wrapper.workspace_symbol()
  vim.lsp.buf.workspace_symbol()
end

-- diagnostic

function lsp_wrapper.get_all()
  vim.lsp.diagnostic.get_all()
end

function lsp_wrapper.get_next()
  vim.lsp.diagnostic.get_next()
end

function lsp_wrapper.get_prev()
  vim.lsp.diagnostic.get_prev()
end

function lsp_wrapper.goto_next()
  -- vim.lsp.diagnostic.goto_next()
  require('lspsaga.diagnostic').lsp_jump_diagnostic_next()
end

function lsp_wrapper.goto_prev()
  -- vim.lsp.diagnostic.goto_prev()
  require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()
end

function lsp_wrapper.show_line_diagnostics()
  vim.lsp.diagnostic.show_line_diagnostics()
end

function lsp_wrapper.restart_lsp()
  local clients = vim.lsp.get_active_clients()
  vim.lsp.stop_client(clients)
  vim.lsp.start_client(clients)
end

function lsp_wrapper.fix_current()
  local params = vim.lsp.util.make_range_params()
  params.context = {diagnostics = {}, only = {'quickfix'}}

  local responses = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)

  print(vim.inspect(responses))

  if not responses or vim.tbl_isempty(responses) then
    print('No quickfix found.')
    return
  end

  print(vim.inspect(responses))
end

function lsp_wrapper.organize_imports()
  local params = vim.lsp.util.make_range_params()
  params.context = {diagnostics = {}, only = {'source.organizeImports'}}

  local responses = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)

  if not responses or vim.tbl_isempty(responses) then
    print('No response from language servers.')
    return
  end

  for i, response in pairs(responses) do
    for _, result in pairs(response.result or {}) do
      if result.edit then
        vim.lsp.util.apply_workspace_edit(result.edit)
      elseif result.command then
        vim.lsp.buf.execute_command(result.command)
      elseif result.data then
        -- print(vim.inspect(vim.lsp.get_client_by_id(i)))
        vim.lsp.buf.execute_command({command = 'codeAction/resolve', data = result.data, title = response.title})
      else
        print('No language client can provide organizing imports.')
      end
    end
  end
end

local helpers = require('helper-functions')
helpers.command.wrap_to_command({
  {'LspCodeAction', 'lua require("lsp-configurations.lsp-wrapper").code_action()'},
  {'LspDeclaration', 'lua require("lsp-configurations.lsp-wrapper").declaration()'},
  {'LspDefinition', 'lua require("lsp-configurations.lsp-wrapper").definition()'},
  {'LspDocumentSymbol', 'lua require("lsp-configurations.lsp-wrapper").document_symbol()'},
  {'LspFormatting', 'lua require("lsp-configurations.lsp-wrapper").formatting()'},
  {'LspFormattingSync', 'lua require("lsp-configurations.lsp-wrapper").formatting_sync()'},
  {'LspHover', 'lua require("lsp-configurations.lsp-wrapper").hover()'},
  {'LspHoverPreview', 'lua require("lspsaga.provider").preview_definition()'},
  {'LspImplementation', 'lua require("lsp-configurations.lsp-wrapper").implementation()'},
  {'LspRangeCodeAction', 'lua require("lsp-configurations.lsp-wrapper").range_code_action()'},
  {'LspRangeFormatting', 'lua require("lsp-configurations.lsp-wrapper").range_formatting()'},
  {'LspReferences', 'lua require("lsp-configurations.lsp-wrapper").references()'},
  {'LspRename', 'lua require("lsp-configurations.lsp-wrapper").rename()'},
  {'LspTypeDefinition', 'lua require("lsp-configurations.lsp-wrapper").type_definition()'},
  {'LspWorkspaceSymbol', 'lua require("lsp-configurations.lsp-wrapper").workspace_symbol()'},
  {'LspGotoNext', 'lua require("lsp-configurations.lsp-wrapper").goto_next()'},
  {'LspGotoPrev', 'lua require("lsp-configurations.lsp-wrapper").goto_prev()'},
  {'LspShowLineDiagnostics', 'lua require("lsp-configurations.lsp-wrapper").show_line_diagnostics()'},
  {'LspRestart', 'lua require("lsp-configurations.lsp-wrapper").restart_lsp()'},
  {'LspFixCurrent', 'lua require("lsp-configurations.lsp-wrapper").fix_current()'},
  {'LspOrganizeImports', 'lua require("lsp-configurations.lsp-wrapper").organize_imports()'}
})

return lsp_wrapper
