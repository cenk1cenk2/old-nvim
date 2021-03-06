vim.g.dashboard_custom_header = {'nvim'}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
  a = {description = {'  Load Last Session'}, command = 'SessionLoad'},
  b = {description = {'ﭯ  Sessions'}, command = 'CocList sessions'},
  c = {description = {'  Find File'}, command = 'Telescope find_files'},
  d = {description = {'  File Browser'}, command = 'Telescope file_browser'},
  e = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
  f = {description = {'  Quit'}, command = 'qa!'}
}

vim.g.dashboard_session_directory = vim.env['HOME'] .. '/.cache/nvim/session'
