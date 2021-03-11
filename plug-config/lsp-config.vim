" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gf :LspDefinition<CR>
nnoremap <silent> gv :LspDeclaration<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gi :LspImplementation<CR>

nnoremap <silent> K :LspHover<CR>

nnoremap <silent> <C-p> :LspGoToNext<CR>
nnoremap <silent> <C-n> :LspGoToPrev<CR>

" autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

