local helpers = require('helper-functions')

require('gitsigns').setup {
  signs = {
    -- TODO add hl to colorscheme
    add = {hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn'},
    change = {hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
    delete = {hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
    topdelete = {hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'}
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true

    --[[ ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>', ]]

    -- Text objects
    --[[ ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>' ]]
  },
  watch_gitdir = {interval = 1000},
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil -- Use default
}

helpers.command.wrap_to_command({
  {'GitSignsNextHunk', 'lua require("gitsigns").next_hunk()'},
  {'GitSignsPrevHunk', 'lua require("gitsigns").prev_hunk()'},
  {'GitSignsResetHunk', 'lua require("gitsigns").reset_hunk()'},
  {'GitSignsPreviewHunk', 'lua require("gitsigns").preview_hunk()'},
  {'GitSignsToggle', 'lua require("gitsigns").toggle_signs()'}
})

