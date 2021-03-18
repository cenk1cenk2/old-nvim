local helpers = require('helper-functions')

vim.g.indent_guides_enable_on_vim_startup = 0
vim.g.indent_guides_auto_colors = 0

helpers.theme.add_highlight({['IndendGuidesOdd'] = {guibg = '#1f2832'}, ['IndentGuidesEven'] = {guibg = '#1e2127'}})
