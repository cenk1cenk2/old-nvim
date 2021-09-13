-- init.lua
vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = 'right',
  keymaps = {close = 'q', goto_location = '<Cr>', focus_location = 'o', hover_symbol = '<C-Space>', rename_symbol = 'r', code_actions = 'a'},
  lsp_blacklist = {}
}
