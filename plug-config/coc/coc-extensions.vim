augroup TerminalStuff
	autocmd BufNew,BufEnter gitcommit  execute "silent! CocEnable"
	autocmd BufLeave * execute "silent! CocDisable"
augroup END

let g:coc_global_extensions = [
\ 'coc-lists',
\ 'coc-floaterm',
\ 'coc-fzf-preview',
\ 'coc-marketplace',
\ 'coc-gitignore',
\ 'coc-gist',
\ 'coc-github',
\ 'coc-git',
\ 'coc-docthis',
\ ]
" \ 'coc-highlight',
