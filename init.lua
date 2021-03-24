-- general settings
require('plugins')
require('settings')
require('configurations')
require('keybindings')

if (vim.g.vscode) then
  -- vscode extension
  vim.api.nvim_command('source ~/.config/nvim/utils/vscode/settings.vim')
else
  -- themes
  require('theme')

  -- plugin configuration
  require('plugin-configurations')

  -- lsp configuration
  require('lsp-configurations')
  require('lsp-language-configurations')
end
