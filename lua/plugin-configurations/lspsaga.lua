local saga = require('lspsaga')

saga.init_lsp_saga({
  code_action_keys = {quit = '<C-c>', exec = '<CR>'},
  code_action_icon = '💡',
  code_action_prompt = {enable = false, sign = false, sign_priority = 9, virtual_text = false}
})

-- scroll down hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-f>', 'lua require("lspsaga.actions").smart_scroll_with_saga(1)<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', 'lua require("lspsaga.actions").smart_scroll_with_saga(-1)<CR>', {silent = true})
