local helpers = require('helper-functions')

vim.g.anyfold_fold_comments = 1

helpers.command.set_option({foldlevel = 99})

helpers.theme.add_highlight({['Folded'] = {guibg = '#3e4551', guifg = '#efefef'}})
