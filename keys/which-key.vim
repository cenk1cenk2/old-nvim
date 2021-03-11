" Leader Key Maps
let @s = 'veS"'

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" let g:which_key_position = 'botright'
" let g:which_key_position = 'topleft'
" let g:which_key_vertical = 1

" Change the colors if you want

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
<<<<<<< HEAD
let g:which_key_map[';'] = [ ':Telescope Commands',                           'commands' ]
let g:which_key_map['/'] = [ ':History/',                                     'history']
let g:which_key_map['='] = [ '<C-W>=',                                        'balance windows' ]
let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=file+', 'explorer' ]
let g:which_key_map['E'] = [ ':Telescope file_browser',                       'file-browser']
let g:which_key_map['h'] = [ '<C-W>s',                                        'split below']
let g:which_key_map['v'] = [ '<C-W>v',                                        'split right']
let g:which_key_map['n'] = [ ':let @/ = ""',                                  'no highlight' ]
let g:which_key_map['M'] = [ ':MaximizerToggle',                              'maximize' ]
let g:which_key_map['p'] = [ ':Telescope find_files theme=get_dropdown',      'find file']
let g:which_key_map['q'] = [ '<Plug>(coc-fix-current)',                       'quickfix' ]
let g:which_key_map['u'] = [ ':UndotreeToggle',                               'undo tree']
let g:which_key_map['W'] = [ ':call WindowSwap#EasyWindowSwap()',             'move window' ]
let g:which_key_map['r'] = [ ':RnvimrToggle',                                 'ranger' ]
||||||| 56f65b1
let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                                       , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                                          , 'balance windows' ]
let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=file+'   , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['n'] = [ ':let @/ = ""'                                    , 'no highlight' ]
let g:which_key_map['o'] = [ ':RnvimrToggle'                                   , 'open' ]
let g:which_key_map['p'] = [ ':Files'                                          , 'search files' ]
let g:which_key_map['q'] = [ '<Plug>(coc-fix-current)'                         , 'quickfix' ]
let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                 , 'treesitter highlight' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                                 , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
let g:which_key_map['W'] = [ ':call WindowSwap#EasyWindowSwap()'               , 'move window' ]
let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]

=======
let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
let g:which_key_map['?'] = [ ':NvimTreeFindFile'                               , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                                       , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                                          , 'balance windows' ]
let g:which_key_map['e'] = [ ':NvimTreeToggle'                                 , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['n'] = [ ':let @/ = ""'                                    , 'no highlight' ]
let g:which_key_map['o'] = [ ':RnvimrToggle'                                   , 'open' ]
let g:which_key_map['p'] = [ ':Files'                                          , 'search files' ]
" TODO fix this
" let g:which_key_map['q'] = [ ':q'                                              , 'quit' ]
let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                 , 'treesitter highlight' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                                 , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
let g:which_key_map['W'] = [ ':call WindowSwap#EasyWindowSwap()'               , 'move window' ]
let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]

>>>>>>> da97d7d0bd7fbbc32009f80341149da7ea73f784
" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions',
      \ 'a' : [':AnyFoldActivate ',                   'activate anyfold'],
      \ 'c' : [':ColorizerToggle',                    'colorizer'],
      \ 'd' : [':! ansible-vault decrypt %:p',        'ansible-vault decrypt'],
      \ 'D' : [':! ansible-vault encrypt %:p',        'ansible-vault encrypt'],
      \ 'f' : [':Telescope filetypes',                'select from filetypes'],
      \ 'm' : [':MarkdownPreview',                    'markdown preview'],
      \ 'M' : [':MarkdownPreviewStop',                'markdown preview stop'],
      \ 'L' : [':set nonumber!',                      'line-numbers'],
      \ 'r' : [':set norelativenumber!',              'relative line nums'],
      \ 't' : [':!markdown-toc %:p --bullets="-" -i', 'markdown-toc'],
      \ 'T' : [':TSHighlightCapturesUnderCursor',     'show treesitter theme color'],
      \ 'v' : [':Codi',                               'virtual repl on'],
      \ 'V' : [':Codi!',                              'virtual repl off'],
      \ 'w' : [':StripWhitespace',                    'strip whitespace'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'b' : [':BufferPick',                                                                                            'pick buffer'],
      \ 'd' : [':Bdelete',                                                                                               'delete-buffer'],
      \ 'D' : [':BufferOrderByDirectory',                                                                                'order by directory'],
      \ 'h' : ['bfirst',                                                                                                 'first-buffer'],
      \ 'e' : ['blast',                                                                                                  'last buffer'],
      \ 'L' : [':BufferOrderByLanguage',                                                                                 'order by language'],
      \ 'f' : [':Telescope buffers',                                                                                     'buffers-telescope'],
      \ 'F' : [':CocCommand fzf-preview.AllBuffers --preview "bat --style=numbers --color=always --line-range :500 {}"', 'buffers-fzf'],
      \ 's' : [':edit #',                                                                                                'jump between two last buffers'],
      \ 'C' : [':%bd',                                                                                                   'close-all'],
      \ 'X' : [':BufferCloseAllButCurrent',                                                                              'close-all but current'],
      \ 'Y' : [':BufferCloseBuffersRight',                                                                               'close-all to right'],
      \ }

" d is for debug
let g:which_key_map.d = {
      \ 'name' : '+debug',
      \ 'a' : ['<Plug>VimspectorAddFunctionBreakpoint',       'function breakpoint'],
      \ 'b' : ['<Plug>VimspectorToggleBreakpoint',            'breakpoint'],
      \ 'B' : ['<Plug>VimspectorToggleConditionalBreakpoint', 'conditional breakpoint'],
      \ 'c' : ['<Plug>VimspectorRunToCursor',                 'run to cursor'],
      \ 'C' : [':call vimspector#ClearBreakpoints()',         'clear all breakpoints'],
      \ 'd' : ['<Plug>VimspectorContinue',                    'continue'],
      \ 'f' : [':Telescope vimspector configurations',        'configurations'],
      \ 'o' : ['<Plug>VimspectorStepOver',                    'step over'],
      \ 'O' : ['<Plug>VimspectorStepOut',                     'step out'],
      \ 'i' : ['<Plug>VimspectorStepInto',                    'step into'],
      \ 'k' : ['<Plug>VimspectorBalloonEval',                 'this'],
      \ 'p' : ['<Plug>VimspectorPause',                       'pause'],
      \ 'r' : ['<Plug>VimspectorRestart',                     'restart'],
      \ 'R' : [':VimspectorReset',                            'reset'],
      \ 's' : ['<Plug>VimspectorStop',                        'stop'],
      \ }

" m is for mark
let g:which_key_map.m = {
      \ 'name' : '+mark' ,
      \ 'c' : [':BookmarkClear', 'clear file'],
      \ 'C' : [':BookmarkClearAll', 'clear project'],
      \ 'n' : [':BookmarkNext', 'next bookmark'],
      \ 'p' : [':BookmarkPrev', 'prev bookmark'],
      \ 't' : [':BookmarkToggle', 'toggle bookmark'],
      \ 'a' : [':BookmarkAnnotate', 'add annotated bookmark'],
      \ 'f'  :[':CocCommand fzf-preview.Bookmarks', 'list bookmarks']
      \ }

<<<<<<< HEAD
let g:which_key_map.f = {
      \ 'name' : '+search',
      \ ';' : [':Telescope commands',                                                                                        'commands'],
      \ 'A' : [':Telescope builtin',                                                                                         'telescope'],
      \ 'a' : [':Ag',                                                                                                        'text ag'],
      \ 'b' : [':CocCommand fzf-preview.Lines --preview "bat --style=numbers --color=always --line-range :500 {}"',          'current buffer'],
      \ 'd' : [':CocCommand fzf-preview.DirectoryFiles --preview "bat --style=numbers --color=always --line-range :500 {}"', 'files in directory'],
      \ 'f' : [':Telescope find_files',                                                                                      'files'],
      \ 'F' : [':Telescope oldfiles',                                                                                        'file history'],
      \ 'h' : [':History:',                                                                                                  'command history'],
      \ 'g' : [':Telescope grep_string',                                                                                     'grep string under cursor'],
      \ 'l' : [':Lines',                                                                                                     'text in open buffers'] ,
      \ 'm' : [':Telescope marks',                                                                                           'marks'],
      \ 'j' : [':CocCommand fzf-preview.Jumps --preview "bat --style=numbers --color=always --line-range :500 {}"',          'jumps'],
      \ 'k' : [':Telescope keymaps',                                                                                         'keymaps'],
      \ 's' : [':Telescope ultisnips ultisnips',                                                                             'snippets'],
      \ 'S' : [':Telescope spell_suggest',                                                                                   'spell suggest'],
      \ 'p' : [':Skylight!',                                                                                                 'skylight preview symbol'],
      \ 'r' : [':call RipgrepInteractive()',                                                                                 'rg interactive'],
      \ 'R' : [':Telescope registers',                                                                                       'registers'],
      \ 't' : [':Rg',                                                                                                        'all files for text rg'],
      \ 'T' : [':Telescope live_grep',                                                                                       'text-telescope'],
      \ 'o' : [':CocList outline',                                                                                           'search outline'],
      \ 'O' : [':Telescope vim_options',                                                                                     'vim options'],
      \ 'w' : [':Windows',                                                                                                   'search windows'],
      \ }
||||||| 56f65b1
" " s is for search
" let g:which_key_map.s = {
"       \ 'name' : '+search' ,
"       \ '/' : [':History/'              , 'history'],
"       \ ';' : [':Commands'              , 'commands'],
"       \ 'a' : [':Ag'                    , 'text Ag'],
"       \ 'b' : [':BLines'                , 'current buffer'],
"       \ 'B' : [':Buffers'               , 'open buffers'],
"       \ 'c' : [':Commits'               , 'commits'],
"       \ 'C' : [':BCommits'              , 'buffer commits'],
"       \ 'f' : [':Files'                 , 'files'],
"       \ 'g' : [':GFiles'                , 'git files'],
"       \ 'G' : [':GFiles?'               , 'modified git files'],
"       \ 'h' : [':History'               , 'file history'],
"       \ 'H' : [':History:'              , 'command history'],
"       \ 'l' : [':Lines'                 , 'lines'] ,
"       \ 'm' : [':Marks'                 , 'marks'] ,
"       \ 'M' : [':Maps'                  , 'normal maps'] ,
"       \ 'p' : [':Helptags'              , 'help tags'] ,
"       \ 'P' : [':Tags'                  , 'project tags'],
"       \ 's' : [':CocList snippets'      , 'snippets'],
"       \ 'S' : [':Colors'                , 'color schemes'],
"       \ 't' : [':Rg'                    , 'text Rg'],
"       \ 'T' : [':BTags'                 , 'buffer tags'],
"       \ 'w' : [':Windows'               , 'search windows'],
"       \ 'y' : [':Filetypes'             , 'file types'],
"       \ 'z' : [':FZF'                   , 'FZF'],
"       \ }
      " \ 's' : [':Snippets'     , 'snippets'],
=======
>>>>>>> da97d7d0bd7fbbc32009f80341149da7ea73f784

<<<<<<< HEAD
" f is for find and replace
||||||| 56f65b1
" TODO fix FZF preview or just move to Telescope
" s is for search powered by telescope
=======
" s is for search powered by telescope
>>>>>>> da97d7d0bd7fbbc32009f80341149da7ea73f784
let g:which_key_map.s = {
      \ 'name' : '+find & replace',
      \ 'f' : [':Farf --source=vimgrep --file-mask="%:p"', 'find in buffer'],
      \ 'F' : [':Farf --source=rgnvim',                    'find in workspace'],
      \ 'r' : [':Farr --source=vimgrep --file-mask="%:p"', 'replace in buffer'],
      \ 'R' : [':Farr --source=rgnvim',                    'replace in workspace'],
      \ }

" session stuff
let g:which_key_map.w = {
      \ 'name' : '+Session',
      \ 'c' : [':SClose',           'Close Session'],
      \ 'd' : [':SDelete!',         'Delete Session'],
      \ 'l' : [':SLoad',            'Load Session'],
      \ 'h' : [':Startify',         'Start Page'],
      \ 's' : [':SSave!',           'Save Session'],
      \ 'f' : [':CocList sessions', 'List Session'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'b' : [':Git blame',                        'blame'],
      \ 'B' : [':Telescope git_branches',           'branches'],
      \ 'c' : [':call GDiffCompare()',              'compare with branch'],
      \ 'd' : [':Gdiffsplit',                       'diff split'],
      \ 'D' : [':Git diff',                         'diff'],
      \ 'e' : [':Gedit',                            'edit-version'],
      \ 'f' : [':GFiles?',                          'modified git files'],
      \ 'F' : [':Telescope git_files',              'git_files'],
      \ 'h' : ['<Plug>(GitGutterPreviewHunk)',      'preview hunk'],
      \ 'H' : [':GitGutterLineHighlightsToggle',    'highlight hunks'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)',         'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)',         'prev hunk'],
      \ 'm' : ['<plug>(MergetoolToggle)',           'merge tool'],
      \ 'M' : [':Gvdiffsplit!',                     'merge view, 3-way-split'],
      \ 's' : [':CocCommand fzf-preview.GitStatus', 'status'],
      \ 't' : [':GitGutterSignsToggle',             'toggle signs'],
      \ 'U' : ['<Plug>(GitGutterUndoHunk)',         'undo hunk'],
      \ 'v' : [':Telescope git_bcommits',           'view buffer commits'],
      \ 'V' : [':Telescope git_commits',            'view commits'],
      \ }

let g:which_key_map.G = {
      \ 'name' : '+gist',
      \ 'f' : [':CocList gist',           'list'],
      \ 'p' : [':CocCommand gist.create', 'post gist '],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
<<<<<<< HEAD
      \ 'name' : '+lsp',
      \ ';' : [':CocList commands',                               'commands'],
      \ '.' : [':CocConfig',                                      'config'],
      \ ',' : ['<Plug>(coc-refactor)',                            'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction-selected)',                 'selected action'],
      \ 'A' : ['<Plug>(coc-codeaction)',                          'code action'],
      \ 'b' : [':CocNext',                                        'next action'],
      \ 'B' : [':CocPrev',                                        'prev action'],
      \ 'c' : [':CocCommand docthis.documentThis',                'document this function'],
      \ 'd' : ['<Plug>(coc-definition)',                          'definition'],
      \ 'D' : ['<Plug>(coc-declaration)',                         'declaration'],
      \ 'e' : [':CocList extensions',                             'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)',                     'format selected'],
      \ 'F' : ['<Plug>(coc-format)',                              'format'],
      \ 'g' : [':CocCommand editor.action.organizeImport',        'organize imports'],
      \ 'h' : ['<Plug>(coc-float-hide)',                          'hide'],
      \ 'i' : ['<Plug>(coc-implementation)',                      'implementation'],
      \ 'I' : [':CocList diagnostics',                            'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)',                          'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)',                     'code lens'],
      \ 'L' : [':CocList',                                        'coc-list'],
      \ 'o' : [':CocList outline',                                'search outline'],
      \ 'O' : [':Vista!!',                                        'outline'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)',                     'next diagnostic'],
      \ 'm' : [':CocCommand workspace.renameCurrentFile',         'rename current file'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)',               'next error'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)',                     'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)',               'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)',                         'quickfix'],
      \ 'r' : ['<Plug>(coc-references)',                          'references'],
      \ 'R' : ['<Plug>(coc-rename)',                              'rename'],
      \ 't' : ['<Plug>(coc-type-definition)',                     'type definition'],
      \ 'u' : [':CocListResume',                                  'resume list'],
      \ 'U' : [':CocUpdate',                                      'update CoC'],
      \ 'T' : [':CocCommand tsserver.restart',                    'restart ts server'],
      \ 'z' : [':CocDisable',                                     'disable CoC'],
      \ 'Z' : [':CocEnable',                                      'enable CoC'],
      \ '@' : [':Telescope node_modules list theme=get_dropdown', 'node_modules'],
||||||| 56f65b1
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
=======
      \ 'name' : '+lsp' ,
      \ 'a' : [':Lspsaga code_action'                , 'code action'],
      \ 'A' : [':Lspsaga range_code_action'          , 'selected action'],
      \ 'd' : [':LspDefinition'                      , 'definition'],
      \ 'D' : [':LspDeclaration'                     , 'workspace_diagnostics'],
      \ 'f' : [':LspFormatting'                      , 'format'],
      \ 'h' : [':Lspsaga hover_doc'                  , 'hover_doc'],
      \ 'H' : [':Lspsaga signature_help'             , 'signature_help'],
      \ 'K' : [':LspHover'                           , 'hover'],
      \ 'i' : [':LspImplementation'                  , 'lsp_info'],
      \ 'I' : [':LspInfo'                            , 'lsp_info'],
      \ 'l' : [':Lspsaga lsp_finder'                 , 'lsp_finder'],
      \ 'L' : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      \ 'n' : [':Lspsaga diagnostic_jump_next'       , 'next_diagnostic'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'p' : [':Lspsaga diagnostic_jump_prev'       , 'prev diagnostic'],
      \ 'q' : [':Lspsaga code_action'                , 'quickfix'],
      \ 'r' : [':LspReferences'                      , 'references'],
      \ 'R' : [':LspRename'                          , 'rename'],
      \ 'T' : [':LspTypeDefinition'                  , 'type defintion'],
      \ 'x' : [':cclose'                             , 'close quickfix'],
      \ 'y' : [':LspDocumentSymbol'                  , 'document symbols'],
      \ 'Y' : [':LspWorkspaceSymbol'                 , 'workspace symbols'],
>>>>>>> da97d7d0bd7fbbc32009f80341149da7ea73f784
      \ }

" t is for terminal
let g:which_key_map.t = {
<<<<<<< HEAD
      \ 'name' : '+terminal',
      \ '.' : [':FloatermNew --wintype=normal --height=10', 'terminal on bottom'],
      \ ',' : [':FloatermNew',                              'terminal'],
      \ 'F' : [':FloatermNew fzf',                          'fzf'],
      \ 'g' : [':FloatermNew lazygit',                      'git'],
      \ 'd' : [':FloatermNew lazydocker',                   'docker'],
      \ 'r' : [':FloatermNew ranger',                       'ranger'],
      \ 'h' : [':FloatermNew htop',                         'htop'],
      \ 'n' : [':FloatermNew ncdu',                         'ncdu'],
      \ 'f' : [':CocList floaterm',                         'find terminal'],
      \ 't' : [':FloatermToggle',                           'toggle'],
      \ 's' : [':FloattermShow',                            'floaterm-show'],
      \ 'k' : [':FloattermKill!',                           'floaterm-kill'],
||||||| 56f65b1
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
=======
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'u' : [':FloatermNew ncdu'                              , 'ncdu'],
>>>>>>> da97d7d0bd7fbbc32009f80341149da7ea73f784
      \ }

" T is for task
let g:which_key_map.T = {
      \ 'name' : '+task',
      \ 'e' : [':AsyncTaskEdit',                 'edit local tasks'],
      \ 'g' : [':AsyncTaskEdit!',                'edit global tasks'],
      \ 'h' : [':AsyncTaskList!',                'list hidden tasks'],
      \ 'f' : [':Telescope asynctasks all',      'list tasks'],
      \ 'm' : [':AsyncTaskMacro',                'macro help'],
      \ 'o' : [':copen',                         'open task view'],
      \ 'd' : [':AsyncTask docker-compose-up',   'docker-compose up'],
      \ 'D' : [':AsyncTask docker-compose-up-d', 'docker-compose up -d'],
      \ 'x' : [':cclose',                        'close task view'],
      \ }


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
