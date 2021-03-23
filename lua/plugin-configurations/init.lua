require('plugin-configurations.init-core')

--

require('plugin-configurations.anyfold')
require('plugin-configurations.asynctask')
vim.api.nvim_command('source ~/.config/nvim/lua/plugin-configurations/asynctask.vim')
require('plugin-configurations.better-whitespace')
require('plugin-configurations.closetag')
require('plugin-configurations.coc')
require('plugin-configurations.colorizer')
require('plugin-configurations.easy-align')
vim.api.nvim_command('source ~/.config/nvim/lua/plugin-configurations/far.vim')
vim.api.nvim_command('source ~/.config/nvim/lua/plugin-configurations/fugitive.vim')
vim.api.nvim_command('source ~/.config/nvim/lua/plugin-configurations/fzf.vim')
require('plugin-configurations.galaxyline')
require('plugin-configurations.gitsigns')
require('plugin-configurations.highlightyank')
require('plugin-configurations.hop')
vim.api.nvim_command('source ~/.config/nvim/lua/plugin-configurations/jinja.vim')
require('plugin-configurations.markdown-preview')
require('plugin-configurations.maximizer')
require('plugin-configurations.nerdcommenter')
require('plugin-configurations.nvim-autopairs')
require('plugin-configurations.nvim-peekup')
if (not vim.g.vscode) then require('plugin-configurations.polyglot') end
require('plugin-configurations.quickscope')
require('plugin-configurations.rnvimr')
require('plugin-configurations.skylight')
require('plugin-configurations.tagalong')
require('plugin-configurations.telescope')
require('plugin-configurations.ultisnips')
require('plugin-configurations.indent-blankline')
require('plugin-configurations.vim-rooter')
require('plugin-configurations.vimspector')
require('plugin-configurations.windowswap')
