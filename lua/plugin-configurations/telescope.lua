local actions = require('telescope.actions')

local rg_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--ignore'}

require('telescope').setup({
  defaults = {
    find_command = rg_arguments,
    vimgrep_arguments = rg_arguments,
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '🔍 ',
    selection_caret = ' ',
    entry_prefix = '  ',
    layout_config = {prompt_position = 'bottom', horizontal = {mirror = false, width = 0.9}, vertical = {mirror = false, width = 0.8}},
    file_ignore_patterns = {'**/yarn.lock', '**/node_modules/**', '**/package-lock.json', '**/.git'},
    mappings = {i = {['<C-e>'] = actions.cycle_previewers_next, ['<C-r>'] = actions.cycle_previewers_prev}}
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      theme = 'dropdown',
      previewer = false,
      mappings = {i = {['<c-d>'] = 'delete_buffer'}, n = {['<c-d>'] = require('telescope.actions').delete_buffer}}
    },
    find_files = {theme = 'dropdown'}
  },
  extensions = {media_files = {filetypes = {'png', 'webp', 'jpg', 'jpeg'}, find_cmd = 'rg'}, tele_tabby = {use_highlighter = true}}
})

-- extensions
local telescope = require('telescope')

telescope.load_extension('gh')
-- telescope.load_extension('node_modules')
telescope.load_extension('lsp_handlers')
telescope.load_extension('media_files')

-- local action_state = require('telescope.actions.state')
-- local actions = require('telescope.actions')
--
-- -- add close buffer
-- Telescope_custom_buffers = function()
--   require('telescope.builtin').buffers({
--     attach_mappings = function(prompt_bufnr, map)
--       local delete_buf = function()
--         local selection = action_state.get_selected_entry()
--         actions.close(prompt_bufnr)
--         vim.api.nvim_buf_delete(selection.bufnr, {force = true})
--       end
--
--       map('i', '<c-q>', delete_buf)
--
--       return true
--     end
--   })
-- end
--
M = {}

local TELESCOPE_RG_INTERACTIVE_LAST_ARGS

function M.TelescopeRipgrepInteractive()
  vim.call('inputsave')

  local args = vim.fn.input('Pass in ripgrep arguments' .. ' ➜  ', TELESCOPE_RG_INTERACTIVE_LAST_ARGS)

  vim.api.nvim_command('normal :esc<CR>')

  vim.api.nvim_out_write('rg ➜  ' .. args .. '\n')

  TELESCOPE_RG_INTERACTIVE_LAST_ARGS = args

  local chunks = {}

  for substring in args:gmatch('%S+') do table.insert(chunks, substring) end

  local command = ':Telescope live_grep vimgrep_arguments=' .. table.concat(rg_arguments, ',') .. ',' .. table.concat(chunks, ',')

  vim.api.nvim_command(command)

  vim.call('inputrestore')
end

local helpers = require('helper-functions')
helpers.command.wrap_to_command({{'TelescopeRipgrepInteractive', 'lua require("plugin-configurations.telescope").TelescopeRipgrepInteractive()'}})

return M
