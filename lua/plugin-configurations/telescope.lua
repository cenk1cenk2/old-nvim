local actions = require('telescope.actions')
-- Global remapping
-- '--color=never',
require('telescope').setup {
  defaults = {
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_position = 'top',
    prompt_prefix = '🔍 ',
    selection_caret = ' ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-x>"] = false,

        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,

        -- Add up multiple actions
        ['<CR>'] = actions.select_default + actions.center

        -- You can perform as many actions in a row as you like
        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous
        -- ["<esc>"] = actions.close,
        -- ["<C-i>"] = my_cool_custom_action,
      }
    }
  },
  require('telescope').setup {
    extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {'png', 'webp', 'jpg', 'jpeg'},
        find_cmd = 'rg' -- find command (defaults to `fd`)
      },

      tele_tabby = {use_highlighter = true}
    }
  }
}

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
