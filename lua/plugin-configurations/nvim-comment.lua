require('nvim_comment').setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = 'gcc',
  -- Visual/Operator mapping left hand side
  operator_mapping = 'gc',
  -- Hook function to call before commenting takes place
  hook = function()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'vue' then require('ts_context_commentstring.internal').update_commentstring() end
  end
})

vim.api.nvim_set_keymap('n', [[<C-\>]], 'gcc', {})
vim.api.nvim_set_keymap('x', [[<C-\>]], 'gcc', {})
