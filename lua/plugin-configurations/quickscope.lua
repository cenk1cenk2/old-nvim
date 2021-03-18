local helpers = require('helper-functions')

vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
vim.g.qs_max_chars = 150

helpers.theme.add_highlight({
  QuickScopePrimary = {guifg = '#00C7DF', gui = 'underline', ctermfg = 155, cterm = 'underline'},
  QuickScopeSecondary = {guifg = '#eF5F70', gui = 'underline', ctermfg = 81, cterm = 'underline'}
})
