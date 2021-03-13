" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gf :LspDefinition<CR>
nnoremap <silent> gv :LspDeclaration<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gi :LspImplementation<CR>
nnoremap <silent> ca :Lspsaga code_action<CR>

nnoremap <silent> K :LspHover<CR>

nnoremap <silent> <C-p> :LspGoToNext<CR>
nnoremap <silent> <C-n> :LspGoToPrev<CR>

