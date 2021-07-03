local helpers = require('helper-functions')

vim.g.polyglot_disabled = {'csv', 'ts', 'js', 'html', '2html'}
vim.g.python_highlight_all = 0
vim.g.vim_jsx_pretty_colorful_config = 0

helpers.command.set_option({re = 0})
