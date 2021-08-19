vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDRemoveExtraSpaces = 0
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDSpaceDelims = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDCompactSexyComs = 0

-- comment with ctrl+#
vim.api.nvim_set_keymap('n', [[<C-\>]], [[:call nerdcommenter#Comment(0,"toggle")<CR>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[<C-\>]], [[:call nerdcommenter#Comment(0,"toggle")<CR>]], {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', [[<M-#>]], [[:call nerdcommenter#Comment(0,"sexy")<CR>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[<M-#>]], [[:call nerdcommenter#Comment(0,"sexy")<CR>]], {silent = true, noremap = true})

vim.g.NERDCustomDelimiters = {typescript = {left = [[//]], leftAlt = [[/**]], rightAlt = [[*/]]}, javascript = {left = [[//]], leftAlt = [[/**]], rightAlt = [[*/]]}}
