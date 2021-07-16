local c = require('themes.onedark.colors')

local colors = {bg = c.bg0, fg = c.fg, red = c.red, green = c.green, yellow = c.yellow, blue = c.blue, purple = c.purple, cyan = c.cyan, gray = c.grey}

local one_dark = {
  inactive = {
    a = {fg = colors.gray, bg = colors.bg, gui = 'bold'},
    b = {fg = colors.gray, bg = colors.bg},
    c = {fg = colors.bg, bg = colors.bg},
    z = {fg = colors.gray, bg = colors.bg}
  },
  normal = {a = {fg = colors.bg, bg = colors.green, gui = 'bold'}, b = {fg = colors.fg, bg = colors.bg}, c = {fg = colors.fg, bg = colors.bg}, z = {fg = colors.fg, bg = colors.bg}},
  visual = {a = {fg = colors.bg, bg = colors.purple, gui = 'bold'}},
  replace = {a = {fg = colors.bg, bg = colors.red, gui = 'bold'}},
  insert = {a = {fg = colors.bg, bg = colors.blue, gui = 'bold'}},
  command = {a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'}}
}

return one_dark
