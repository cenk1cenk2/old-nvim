local tree_cb = require('nvim-tree.config').nvim_tree_callback

vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}

vim.g.nvim_tree_icons = {['default'] = ''}

require('nvim-tree').setup({
  -- disables netrw completely
  disable_netrw = true,
  -- hijack netrw window on startup
  hijack_netrw = true,
  -- open the tree when running this setup function
  open_on_setup = true,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {'dashboard'},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = false,
  -- show lsp diagnostics in the signcolumn
  lsp_diagnostics = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 40,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {
        -- mappings
        {key = '<CR>', cb = tree_cb('edit')},
        {key = 'l', cb = tree_cb('edit')},
        {key = 'o', cb = tree_cb('edit')},
        {key = '<2-LeftMouse>', cb = tree_cb('edit')},
        {key = '<2-RightMouse>', cb = tree_cb('cd')},
        {key = 'w', cb = tree_cb('cd')},
        {key = 'v', cb = tree_cb('vsplit')},
        {key = 's', cb = tree_cb('split')},
        {key = '<C-t>', cb = tree_cb('tabnew')},
        {key = 'h', cb = tree_cb('close_node')},
        {key = '<BS>', cb = tree_cb('close_node')},
        {key = '<S-CR>', cb = tree_cb('close_node')},
        {key = '<Tab>', cb = tree_cb('preview')},
        {key = 'I', cb = tree_cb('toggle_ignored')},
        {key = 'H', cb = tree_cb('toggle_dotfiles')},
        {key = 'R', cb = tree_cb('refresh')},
        {key = 'a', cb = tree_cb('create')},
        {key = 'd', cb = tree_cb('remove')},
        {key = 'r', cb = tree_cb('rename')},
        {key = '<C-r>', cb = tree_cb('full_rename')},
        {key = 'x', cb = tree_cb('cut')},
        {key = 'c', cb = tree_cb('copy')},
        {key = 'p', cb = tree_cb('paste')},
        {key = '[c', cb = tree_cb('prev_git_item')},
        {key = ']c', cb = tree_cb('next_git_item')},
        {key = '-', cb = tree_cb('dir_up')},
        {key = 'q', cb = tree_cb('close')}
      }
    }
  }
})

