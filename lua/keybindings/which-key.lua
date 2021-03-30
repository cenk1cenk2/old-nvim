local helpers = require('helper-functions')

-- timeoutwhich_key_timeout
vim.g.which_key_timeout = 25

-- display names
vim.api.nvim_command([[
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
]])

-- Define a separator
vim.g.which_key_sep = '→'

-- Not a fan of floating windows for this
vim.g.which_key_use_floating_win = 0
vim.g.which_key_max_size = 0

-- the main menu
vim.g.which_key_map = {
  [';'] = {':Telescope commands', 'commands'},
  ['/'] = {':History/', 'search history'},
  ['='] = {'<C-W>=', 'balance windows'},
  ['"'] = {'<Plug>PeekupOpen', 'registers'},
  ['e'] = {':NvimTreeToggle', 'explorer'},
  ['?'] = {':NvimTreeFindFile', 'find file in explorer'},
  ['E'] = {':Telescope file_browser', 'file-browser'},
  ['h'] = {'<C-W>s', 'split below'},
  ['v'] = {'<C-W>v', 'split right'},
  ['n'] = {':let @/ = ""', 'no highlight'},
  ['M'] = {':MaximizerToggle', 'maximize'},
  ['p'] = {':Telescope find_files theme=get_dropdown', 'find file'},
  ['r'] = {':RnvimrToggle', 'ranger'},
  ['u'] = {':UndotreeToggle', 'undo tree'},
  ['W'] = {':call WindowSwap#EasyWindowSwap()', 'move window'},

  -- actions
  a = {
    name = '+actions',
    a = {':AnyFoldActivate ', 'activate anyfold'},
    c = {':ColorizerToggle', 'colorizer toggle'},
    d = {':! ansible-vault decrypt %:p', 'ansible-vault decrypt'},
    D = {':! ansible-vault encrypt %:p', 'ansible-vault encrypt'},
    f = {':Telescope filetypes', 'select from filetypes'},
    m = {':MarkdownPreview', 'markdown preview'},
    M = {':MarkdownPreviewStop', 'markdown preview stop'},
    i = {':IndentBlanklineToggle', 'indentation guides'},
    l = {':set nonumber!', 'line-numbers'},
    r = {':set norelativenumber!', 'relative line nums'},
    s = {':setlocal spell!', 'toggle spell check'},
    t = {':!markdown-toc %:p --bullets="-" -i', 'markdown-toc'},
    T = {':TSHighlightCapturesUnderCursor', 'show treesitter theme color'},
    w = {':StripWhitespace', 'strip whitespace'}
  },

  -- buffer
  b = {
    name = '+buffer',
    b = {':BufferPick', 'pick buffer'},
    d = {':Bdelete', 'delete-buffer'},
    h = {':BufferFirst', 'first-buffer'},
    l = {':BufferLast', 'last buffer'},
    L = {':BufferOrderByLanguage', 'order by language'},
    D = {':BufferOrderByDirectory', 'order by directory'},
    f = {':Telescope tele_tabby list theme=get_dropdown', 'buffers-telescope'},
    F = {':CocCommand fzf-preview.AllBuffers --preview "bat --style=numbers --color=always --line-range :500 {}"', 'buffers-fzf'},
    s = {':edit #', 'jump between two last buffers'},
    C = {':%bd', 'close-all'},
    X = {':BufferCloseAllButCurrent', 'close-all but current'},
    Y = {':BufferCloseBuffersRight', 'close-all to right'}
  },

  -- debugger
  d = {
    name = '+debug',
    a = {'<Plug>VimspectorAddFunctionBreakpoint', 'function breakpoint'},
    b = {'<Plug>VimspectorToggleBreakpoint', 'breakpoint'},
    B = {'<Plug>VimspectorToggleConditionalBreakpoint', 'conditional breakpoint'},
    c = {'<Plug>VimspectorRunToCursor', 'run to cursor'},
    C = {':call vimspector#ClearBreakpoints()', 'clear all breakpoints'},
    d = {'<Plug>VimspectorContinue', 'continue'},
    f = {':Telescope vimspector configurations', 'configurations'},
    o = {'<Plug>VimspectorStepOver', 'step over'},
    O = {'<Plug>VimspectorStepOut', 'step out'},
    i = {'<Plug>VimspectorStepInto', 'step into'},
    k = {'<Plug>VimspectorBalloonEval', 'hover this'},
    p = {'<Plug>VimspectorPause', 'pause'},
    r = {'<Plug>VimspectorRestart', 'restart'},
    R = {':VimspectorReset', 'reset'},
    s = {'<Plug>VimspectorStop', 'stop'}
  },

  -- find
  f = {
    name = '+search',
    [';'] = {':Telescope commands', 'commands'},
    A = {':Telescope builtin', 'telescope list all command'},
    b = {':Telescope current_buffer_fuzzy_find theme=get_dropdown', 'current buffer'},
    d = {':CocCommand fzf-preview.DirectoryFiles --preview "bat --style=numbers --color=always --line-range :500 {}"', 'files in directory'},
    f = {':Telescope find_files', 'files'},
    F = {':Telescope oldfiles', 'file history'},
    h = {':History:', 'command history'},
    g = {':Telescope grep_string', 'grep string under cursor'},
    l = {':Lines', 'text in open buffers'},
    m = {':Telescope marks', 'marks'},
    j = {':CocCommand fzf-preview.Jumps --preview "bat --style=numbers --color=always --line-range :500 {}"', 'jumps'},
    k = {':Telescope keymaps', 'keymaps'},
    s = {':Telescope ultisnips ultisnips', 'snippets'},
    S = {':Telescope spell_suggest', 'spell suggest'},
    p = {':Skylight!', 'skylight preview symbol'},
    r = {':call RipgrepInteractive()', 'rg interactive'},
    R = {':Telescope registers', 'registers'},
    t = {':Telescope live_grep', 'text-telescope'},
    T = {':Rg', 'all files for text ripgrep'},
    O = {':Telescope vim_options', 'vim options'},
    w = {':Windows', 'search windows'}
  },

  -- find and replace
  F = {
    name = '+find & replace',
    f = {':Farf --source=vimgrep --file-mask="%:p"', 'find in buffer'},
    F = {':Farf --source=rgnvim', 'find in workspace'},
    r = {':Farr --source=vimgrep --file-mask="%:p"', 'replace in buffer'},
    R = {':Farr --source=rgnvim', 'replace in workspace'}
  },

  g = {
    name = '+git',
    b = {':Git blame', 'blame'},
    B = {':Telescope git_branches', 'branches'},
    c = {':call GDiffCompare()', 'compare with branch'},
    d = {':Gdiffsplit', 'diff split'},
    D = {':Git diff', 'diff'},
    e = {':Gedit', 'edit-version'},
    f = {':GFiles?', 'modified git files'},
    F = {':Telescope git_files', 'git_files'},
    h = {':GitSignsPreviewHunk', 'preview hunk'},
    n = {':GitSignsNextHunk', 'next hunk'},
    p = {':GitSignsPrevHunk', 'prev hunk'},
    M = {':Gvdiffsplit!', 'merge view, 3-way-split'},
    s = {':CocCommand fzf-preview.GitStatus', 'status'},
    t = {':GitSignsToggle', 'toggle hunks'},
    U = {':GitSignsResetHunk', 'undo hunk'},
    v = {':Telescope git_bcommits', 'view buffer commits'},
    V = {':Telescope git_commits', 'view commits'}
  },

  -- gist
  G = {name = '+gist', f = {':CocList gist', 'list'}, p = {':CocCommand gist.create', 'post gist '}},

  -- lsp
  l = {
    name = '+lsp',
    a = {':Lspsaga code_action', 'code action'},
    A = {':Lspsaga range_code_action', 'selected action'},
    d = {':Telescope lsp_document_diagnostics --theme=get_dropdown', 'document diagnostics'},
    D = {':Telescope lsp_workspace_diagnostics --theme=get_dropdown', 'workspace diagnostics'},
    f = {':LspFormattingSync', 'format'},
    h = {':LspHoverPreview', 'preview definition'},
    H = {':Lspsaga signature_help', 'signature help'},
    g = {':LspOrganizeImports', 'organize imports'},
    i = {':LspImplementation', 'implementation'},
    I = {':LspInfo', 'lsp information'},
    l = {':Lspsaga show_line_diagnostics', 'line diagnostics'},
    L = {':Lspsaga lsp_finder', 'lsp finder'},
    n = {':Lspsaga diagnostic_jump_next', 'next diagnostic'},
    m = {':LspRenameFile', 'rename current file'},
    p = {':Lspsaga diagnostic_jump_prev', 'prev diagnostic'},
    q = {':Telescope quickfix', 'quickfix'},
    r = {':LspReferences', 'references'},
    R = {':LspRename', 'rename'},
    T = {':LspTypeDefinition', 'type defintion'},
    s = {':Telescope lsp_document_symbols --theme=get_dropdown', 'document symbols'},
    S = {':Telescope lsp_workspace_symbols --theme=get_dropdown', 'workspace symbols'}
  },

  -- bookmarks
  m = {
    name = '+mark',
    t = {':BookmarkToggle', 'toggle'},
    n = {':BookmarkNext', 'next mark'},
    p = {':BookmarkPrev', 'prev mark'},
    f = {':CocCommand fzf-preview.Bookmarks', 'list bookmarks'}
  },

  -- terminal
  t = {
    name = '+terminal',
    ['-'] = {':ToggleTerm', 'toggleterm'},
    ['.'] = {':FloatermNew --wintype=normal --height=15', 'terminal on bottom'},
    [','] = {':FloatermNew', 'terminal'},
    F = {':FloatermNew fzf', 'fzf'},
    g = {':FloatermNew lazygit', 'git'},
    d = {':FloatermNew lazydocker', 'docker'},
    r = {':FloatermNew ranger', 'ranger'},
    h = {':FloatermNew htop', 'htop'},
    n = {':FloatermNew ncdu', 'ncdu'},
    f = {':CocList floaterm', 'find terminal'},
    t = {':FloatermToggle', 'toggle'},
    s = {':FloattermShow', 'floaterm-show'},
    k = {':FloattermKill!', 'floaterm-kill-all'}
  },

  -- tasks
  T = {
    name = '+task',
    e = {':AsyncTaskEdit', 'edit local tasks'},
    g = {':AsyncTaskEdit!', 'edit global tasks'},
    f = {':Telescope asynctasks all', 'list tasks'},
    m = {':AsyncTaskMacro', 'macro help'},
    d = {':AsyncTask docker-compose-up', 'docker-compose up'},
    D = {':AsyncTask docker-compose-up-d', 'docker-compose up -d'}
  },

  -- workspace/session
  w = {
    name = '+Session',
    c = {':SClose', 'Close Session'},
    d = {':SDelete!', 'Delete Session'},
    l = {':SLoad', 'Load Session'},
    h = {':Startify', 'Start Page'},
    s = {':SSave!', 'Save Session'},
    f = {':CocList sessions', 'List Session'}
  }
}

vim.api.nvim_set_keymap('n', '<Space>', [[:<c-u>WhichKey '<space>'<CR>]], {silent = true})
vim.fn['which_key#register']('<Space>', 'g:which_key_map')
