-- TODO we need snippet support and to maybe get better docs idk
vim.cmd [[set shortmess+=c]]

require('compe').setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  allow_prefix_unmatch = false,
  max_abbr_width = 1000,
  max_kind_width = 1000,
  max_menu_width = 1000000,
  documentation = true,

  source = {path = true, buffer = true, vsnip = true, nvim_lsp = true, nvim_lua = true, spell = true, tags = true, snippets_nvim = true, treesitter = true}
}

-- handled by nvim-autopairs at the moment!
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t '<C-p>'
--   elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
--     return t '<Plug>(vsnip-jump-prev)'
--   else
--     return t '<S-Tab>'
--   end
-- end

vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- completion triggers
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({ "delta": +4 })', {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({ "delta": -4 })', {expr = true, silent = true})

