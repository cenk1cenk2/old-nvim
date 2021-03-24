vim.api.nvim_set_keymap('n', '<a-e>', '<cmd>lua require("illuminate").next_reference{reverse=true,wrap=true}<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<a-r>', '<cmd>lua require("illuminate").next_reference{wrap=true}<cr>', {noremap = true})
