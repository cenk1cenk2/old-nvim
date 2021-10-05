vim.g.kommentary_create_default_mappings = false

vim.api.nvim_set_keymap('n', [[<C-\>]], '<Plug>kommentary_line_default<ESC>', {})
vim.api.nvim_set_keymap('x', [[<C-\>]], '<Plug>kommentary_visual_default<ESC>', {})

require('kommentary.config').configure_language('default', {use_consistent_indentation = true, ignore_whitespace = true})

require('kommentary.config').configure_language('javascript', {single_line_comment_string = '//', multi_line_comment_strings = {'/**', '*/'}})

require('kommentary.config').configure_language('typescript', {single_line_comment_string = '//', multi_line_comment_strings = {'/**', '*/'}})
