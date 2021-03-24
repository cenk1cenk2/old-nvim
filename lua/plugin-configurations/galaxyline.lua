-- require'nvim-web-devicons'.setup()
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'LuaTree', 'vista', 'dbui'}

local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
  return false
end

local vim_mode = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.purple,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.purple,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red
      }

      local mode_name = {
        c = 'COMMAND',
        i = 'INSERT',
        ic = 'INSERT COMP',
        ix = 'INSERT COMP',
        multi = 'MULTI',
        n = 'NORMAL',
        ni = '(INSERT)',
        no = 'OP PENDING',
        R = 'REPLACE',
        Rv = 'V REPLACE',
        s = 'SELECT',
        S = 'S-LINE',
        [''] = 'S-BLOCK',
        t = 'TERMINAL',
        v = 'VISUAL',
        V = 'V-LINE',
        [''] = 'V-BLOCK'
      }

      vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()])
      return '  ' .. mode_name[vim.fn.mode()] .. ' '
    end,
    separator = ' ',
    separator_highlight = {
      colors.yellow,
      function()
        if not buffer_not_empty() then return colors.bg end
        return colors.bg
      end
    },
    highlight = {colors.grey, colors.bg, 'bold'}
  }
}

gls.left[1] = vim_mode

gls.left[2] = {
  GitIcon = {
    provider = function()
      return ' '
    end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
}

gls.left[3] = {
  GitBranch = {provider = 'GitBranch', condition = condition.check_git_workspace, separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}
}

gls.left[4] = {DiffAdd = {provider = 'DiffAdd', condition = condition.hide_in_width, icon = '  ', highlight = {colors.green, colors.bg}}}
gls.left[5] = {DiffModified = {provider = 'DiffModified', condition = condition.hide_in_width, icon = ' 柳 ', highlight = {colors.blue, colors.bg}}}
gls.left[6] = {DiffRemove = {provider = 'DiffRemove', condition = condition.hide_in_width, icon = '  ', highlight = {colors.red, colors.bg}}}

gls.right[1] = {DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.error_red, colors.bg}}}

gls.right[2] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.orange, colors.bg}}}

gls.right[3] = {DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.blue, colors.bg}}}

gls.right[4] = {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.blue, colors.bg}}}

gls.right[5] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = {['dashboard'] = true, [' '] = true}
      if tbl[vim.bo.filetype] then return false end
      return true
    end,
    icon = ' ',
    highlight = {colors.grey, colors.bg}
  }
}

gls.right[6] = {LineInfo = {provider = 'LineColumn', separator = '  ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}}

gls.right[7] = {PerCent = {provider = 'LinePercent', separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}}

-- gls.right[8] = {
--   Tabstop = {
--     provider = function()
--       return 'Spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
--     end,
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE', colors.bg},
--     highlight = {colors.grey, colors.bg}
--   }
-- }

gls.right[9] = {BufferIcon = {provider = 'BufferIcon', highlight = {colors.grey, colors.bg}}}

gls.right[10] = {
  BufferType = {provider = 'FileTypeName', condition = condition.hide_in_width, separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}
}

-- gls.right[10] = {
--   FileEncode = {provider = 'FileEncode', condition = condition.hide_in_width, separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}
-- }

gls.right[11] = {
  Space = {
    provider = function()
      return ' '
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
}

gls.short_line_left[1] = {
  LeftEnd = {
    provider = function()
      return ' '
    end,
    separator = ' ',
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.purple, colors.bg}
  }
}