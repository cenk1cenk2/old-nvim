let g:AutoPairsShortcutToggle = '<C-hgfg>'
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>
