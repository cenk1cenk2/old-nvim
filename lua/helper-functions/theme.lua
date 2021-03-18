local helpers = {}

helpers.add_highlight = function(arr)

  for name, obj in pairs(arr) do
    local command = 'hi'

    if (obj['extend']) then command = command .. ' ' .. obj['extend'] end

    command = command .. ' ' .. name

    local known_keys = {'guibg', 'guifg', 'gui', 'ctermfg', 'cterm'}

    for key, value in pairs(known_keys) do if (obj[value]) then command = command .. ' ' .. value .. '=' .. obj[value] end end

    vim.api.nvim_exec(command, true)
  end
end

return helpers
