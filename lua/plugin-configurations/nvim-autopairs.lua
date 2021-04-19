-- require('nvim-autopairs').setup({check_line_pair = false})
-- local npairs = require('nvim-autopairs')
-- skip it, if you use another global object
-- _G.MUtils = {}
--
-- vim.g.completion_confirm_key = ''
-- MUtils.completion_confirm = function()
--   if vim.fn.pumvisible() ~= 0 then
--     if vim.fn.complete_info()['selected'] ~= -1 then
--       return vim.fn['compe#confirm'](npairs.esc('<c-r>'))
--     else
--       return npairs.esc('<cr>')
--     end
--   else
--     return npairs.autopairs_cr()
--   end
-- end
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', {expr = true, silent = true})

-- vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
