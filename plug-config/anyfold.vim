let ftToIgnore = ['coc-explorer']
" autocmd Filetype * if index(ftToIgnore, &ft) < 0 | AnyFoldActivate
" autocmd Filetype * if index(ftToIgnore, &ft) > 0 | set foldmethod=manual | set foldlevel = 0

let g:anyfold_fold_comments=1
set foldlevel=99

hi Folded guibg=#3e4551 guifg=#efefef
