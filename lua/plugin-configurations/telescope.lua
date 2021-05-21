require('telescope').setup({
  defaults = {
    find_command = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--ignore'},
    vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--ignore'},
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
