vim.g.startify_custom_header = {'    @cenk1cenk2/nvim'}

vim.g.startify_lists = {{type = 'sessions', header = {'   Sessions'}}, {type = 'dir', header = {'   Current Directory ' .. vim.fn.getcwd()}}}

vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1

vim.g.startify_session_autoload = 1
vim.g.startify_session_persistence = 1

vim.g.startify_session_dir = '~/.config/vimsession'

vim.g.webdevicons_enable_startify = 1

vim.g.startify_enable_special = 1

vim.cmd([[
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])

vim.g.startify_bookmarks = {{p = '~/docker'}, {d = '~/development'}, {w = '~/development/work'}, {c = '~/.config/nvim'}, {i = '~/.config/nvim/init.vim'}}

vim.cmd([[
  autocmd BufEnter !gitcommit if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif
]])
