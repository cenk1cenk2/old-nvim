require('telescope').setup({
  defaults = {
    find_command = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--ignore'},
    vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--ignore'},
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_position = 'bottom',
    prompt_prefix = '🔍 ',
    selection_caret = ' ',
    entry_prefix = '  ',
    layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
    file_ignore_patterns = {'yarn.lock', '**/node_modules/**'}
  },
  extensions = {media_files = {filetypes = {'png', 'webp', 'jpg', 'jpeg'}, find_cmd = 'rg'}, tele_tabby = {use_highlighter = true}}
})

-- extensions
local telescope = require('telescope')

telescope.load_extension('gh')
telescope.load_extension('node_modules')
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

function M.TelescopeRipgrepInteractive()
  vim.call('inputsave')

  local args = vim.fn.input('Pass in ripgrep arguments' .. ' ➜ ')

  vim.api.nvim_command('normal :esc<CR>')

  vim.api.nvim_out_write('rg ➜ ' .. args .. '\n')

  vim.api.nvim_command(':Telescope live_grep find_command=rg,--ignore,--hidden,' .. args)

  vim.call('inputrestore')
end

local helpers = require('helper-functions')
helpers.command.wrap_to_command({{'TelescopeRipgrepInteractive', 'lua require("plugin-configurations.telescope").TelescopeRipgrepInteractive()'}})

return M
