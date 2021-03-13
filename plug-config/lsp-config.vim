" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gf :LspDefinition<CR>
nnoremap <silent> gv :LspDeclaration<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gi :LspImplementation<CR>
nnoremap <silent> ca :Lspsaga code_action<CR>

nnoremap <silent> K :LspHover<CR>

nnoremap <silent> <C-p> :LspGoToNext<CR>
nnoremap <silent> <C-n> :LspGoToPrev<CR>

" -- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
" -- use this mapping also with other language servers

autocmd FileType java nnoremap ca <Cmd>lua require('jdtls').code_action()<CR>



" -- If using nvim-dap
" -- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
" nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
" nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

command! -buffer JdtCompile lua require('jdtls').compile()
command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
command! -buffer JdtJol lua require('jdtls').jol()
command! -buffer JdtBytecode lua require('jdtls').javap()
command! -buffer JdtJshell lua require('jdtls').jshell()
