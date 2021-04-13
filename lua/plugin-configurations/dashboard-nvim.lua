vim.g.dashboard_custom_header = {'nvim'}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
  a = {description = {'  Quit'}, command = 'qa!'},
  b = {description = {'  Load Last Session'}, command = 'SessionLoad'},
  c = {description = {'ﭯ  Sessions'}, command = 'CocList sessions'},
  d = {description = {'  Find File'}, command = 'Telescope find_files'},
  e = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'}
}

-- vim.g.dashboard_custom_shortcut = {a = 'f', r = 'r', q = 'q', new_file = 'cn', book_marks = 'SPC f b'}
-- find_history = 'SPC f h',

vim.g.dashboard_session_directory = vim.env['HOME'] .. '/.cache/nvim/session'

local helpers = require('helper-functions')

helpers.autocommand.define_augroups({SessionSave = {{'VimLeave', '*', ':SessionSave'}}})
