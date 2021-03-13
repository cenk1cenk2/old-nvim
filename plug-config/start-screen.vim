let g:startify_custom_header = [
        \ '    @cenk1cenk2/nvim',
        \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]
          " \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },


let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

let g:startify_session_dir = '~/.config/vimsession'

let g:webdevicons_enable_startify = 1

let g:startify_enable_special = 0

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
            \ { 'p': '~/docker' },
            \ { 'd': '~/development' },
            \ { 'w': '~/development/work' },
            \ { 'c': '~/.config/nvim' }
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ ]

" let g:startify_session_before_save = [
"     \ ]

autocmd BufEnter !gitcommit if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif
