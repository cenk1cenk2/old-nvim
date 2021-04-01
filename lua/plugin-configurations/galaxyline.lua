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

-- left

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

-- mid

gls.mid[1] = {
  FileName = {
    provider = {
      function()
        return '  '
      end,
      'FileName',
      'FileSize',
      function()
        return ' '
      end
    },
    condition = function()
      return buffer_not_empty() and condition.hide_in_width()
    end,
    highlight = {colors.grey, colors.purple}
  }
}

gls.mid[2] = {
  FileIcon = {
    provider = {'FileIcon'},
    condition = function()
      return buffer_not_empty() and condition.hide_in_width()
    end,
    icon = '  ',
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg}
  }
}

gls.mid[3] = {
  ShowLspClient = {
    provider = {
      function()
        local clients = vim.lsp.buf_get_clients()

        if next(clients) == nil then return '' end

        local t = ''
        for i, client in ipairs(clients) do
          if i == 1 then
            t = t .. client.name
          else
            t = t .. ', ' .. client.name
          end
        end

        if #t > 0 then
          return '  ' .. t .. ' ➜'
        else
          return ' '
        end
      end,
      function()
        return ' ' .. require('galaxyline.provider_buffer').get_buffer_filetype():lower()
      end,
      function()
        return ' '
      end
    },
    condition = function()
      local tbl = {['dashboard'] = true, [' '] = true}

      if tbl[vim.bo.filetype] then return false end

      return true and condition.hide_in_width()
    end,
    highlight = {colors.grey, colors.purple}
  }
}

local function get_nvim_lsp_diagnostic(diag_type)
  if next(vim.lsp.buf_get_clients()) == nil then return '' end
  local active_clients = vim.lsp.get_active_clients()

  if active_clients then
    local count = 0

    for _, client in ipairs(active_clients) do count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(), diag_type, client.id) end

    if count ~= 0 then return count .. ' ' end
  end
end

gls.mid[5] = {
  DiagnosticError = {
    provider = function()
      if not vim.tbl_isempty(vim.lsp.buf_get_clients()) then return get_nvim_lsp_diagnostic('Error') end
    end,
    icon = '   ',
    highlight = {colors.red, colors.bg}
  }
}

gls.mid[6] = {
  DiagnosticWarn = {
    provider = function()
      if not vim.tbl_isempty(vim.lsp.buf_get_clients()) then return get_nvim_lsp_diagnostic('Warning') end
    end,
    icon = '   ',
    highlight = {colors.orange, colors.bg}
  }
}

gls.mid[7] = {
  DiagnosticHint = {
    provider = function()
      if not vim.tbl_isempty(vim.lsp.buf_get_clients()) then return get_nvim_lsp_diagnostic('Hint') end
    end,
    icon = '   ',
    highlight = {colors.blue, colors.bg}
  }
}

gls.mid[8] = {
  DiagnosticInfo = {
    provider = function()
      if not vim.tbl_isempty(vim.lsp.buf_get_clients()) then return get_nvim_lsp_diagnostic('Information') end
    end,
    icon = '   ',
    highlight = {colors.blue, colors.bg}
  }
}

-- right

gls.right[1] = {
  Tabstop = {
    provider = function()
      return 'sw=' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}

gls.right[2] = {
  FileEncode = {provider = 'FileEncode', condition = condition.hide_in_width, separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}
}

gls.right[3] = {
  LineInfo = {provider = 'LineColumn', separator = ' ', condition = condition.hide_in_width, separator_highlight = {'NONE', colors.bg}, highlight = {colors.grey, colors.bg}}
}

gls.right[4] = {ScrollBar = {provider = 'ScrollBar', separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.yellow, colors.bg}}}

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
