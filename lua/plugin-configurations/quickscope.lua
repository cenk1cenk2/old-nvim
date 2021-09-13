local helpers = require('helper-functions')
local c = require('themes.onedark.colors')

vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
vim.g.qs_max_chars = 150

helpers.theme.add_highlight({
  QuickScopePrimary = {guifg = c.bright_cyan, gui = 'underline', ctermfg = 155, cterm = 'underline'},
  QuickScopeSecondary = {guifg = c.dark_cyan, gui = 'underline', ctermfg = 81, cterm = 'underline'}
})
