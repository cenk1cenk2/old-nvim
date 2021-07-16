local M = {}

vim.g.onedark_style = vim.g.onedark_style or 'default'

local highlights = require('themes.onedark.highlights')
local terminal = require('themes.onedark.terminal')

local function colorscheme()
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.api.nvim_command([[syntax on]])
  vim.api.nvim_command([[set termguicolors]])
  -- vim.g.colors_name = 'onedark'
  -- vim.api.nvim_command([[colorscheme onedark]])
  highlights.setup()
  terminal.setup()
end

function M.setup()
  colorscheme()
end

return M
