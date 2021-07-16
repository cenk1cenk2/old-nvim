local colors = {
  black = {'#17191e'},
  bg0 = {'#1e2127'},
  bg1 = {'#22282f'},
  bg2 = {'#38404b'},
  bg3 = {'#4b5263'},
  bg_d = {'#5c6370'},
  cursor = {'#6c778d'},
  bg_blue = {'#73b8f1'},
  bg_yellow = {'#ebd09c'},
  fg = {'#abb2bf'},
  purple = {'#c678dd'},
  green = {'#98c379'},
  orange = {'#d19a66'},
  blue = {'#61afef'},
  yellow = {'#e5c07b'},
  cyan = {'#56b6c2'},
  red = {'#e06c75'},
  grey = {'#5c6370'},
  dark_cyan = {'#2b6f77'},
  dark_red = {'#993939'},
  dark_yellow = {'#e5c07b'},
  dark_purple = {'#8a3fa0'},
  dark_green = {'#587C0C'},
  dark_blue = {'#1c3448'},
  bright_yellow = {'#FFD700'},
  bright_grey = {'#b0b0b0'},
  bright_green = {'#587C0C'},
  bright_cyan = {'#0C7D9D'},
  bright_red = {'#94151B'},
  diff_add = {'#31392b'},
  diff_delete = {'#382b2c'},
  diff_change = {'#1c3448'},
  diff_text = {'#2c5372'}
}

local styles = {default = 1}

local function select_colors()
  local index = styles[1]
  if vim.g.onedark_style then index = styles[vim.g.onedark_style] end

  local selected = {}

  for k, v in pairs(colors) do selected[k] = v[index] end

  selected['none'] = 'NONE'

  return selected
end

return select_colors()
