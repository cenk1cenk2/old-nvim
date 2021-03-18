vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDRemoveExtraSpaces = 0
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDSpaceDelims = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDCompactSexyComs = 0

-- comment with ctrl+#
vim.api.nvim_set_keymap('n', [[<C-\>]], [[:call NERDComment(0,"toggle")<CR>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[<C-\>]], [[:call NERDComment(0,"toggle")<CR>]], {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', [[<M-#>]], [[:call NERDComment(0,"sexy")<CR>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[<M-#>]], [[:call NERDComment(0,"sexy")<CR>]], {silent = true, noremap = true})

vim.api.nvim_exec([[
  autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
]], true)
