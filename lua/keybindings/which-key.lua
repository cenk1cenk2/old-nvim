local wk = require('which-key')

wk.setup({
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true -- bindings for prefixed with g,
    }
  },
  window = {
    border = 'single', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = {0, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
    padding = {1, 1, 1, 1} -- extra window padding [top, right, bottom, left]
  },
  triggers = {'<leader>', 'g', 'z', '"', '<C-r>'}
})

-- the main menu
wk.register({
  [';'] = {':Telescope commands<CR>', 'commands'},
  ['/'] = {':History/<CR>', 'search history'},
  ['='] = {'<C-W>=<CR>', 'balance windows'},
  ['e'] = {':NvimTreeToggle<CR>', 'explorer'},
  ['?'] = {':NvimTreeFindFile<CR>', 'find file in explorer'},
  ['E'] = {':Telescope file_browser<CR>', 'file-browser'},
  ['h'] = {'<C-W>s', 'split below'},
  ['v'] = {'<C-W>v', 'split right'},
  ['n'] = {':let @/ = ""<CR>', 'no highlight'},
  ['M'] = {':MaximizerToggle<CR>', 'maximize'},
  ['p'] = {':Telescope find_files theme=get_dropdown<CR>', 'find file'},
  ['r'] = {':RnvimrToggle<CR>', 'ranger'},
  ['R'] = {':Rooter<CR>', 'rooter'},
  ['u'] = {':UndotreeToggle<CR>', 'undo tree'},
  ['W'] = {':call WindowSwap#EasyWindowSwap()<CR>', 'move window'},
  ['q'] = {':LspFixCurrent<CR>', 'quick fix'},

  -- actions
  a = {
    name = '+actions',
    a = {':AnyFoldActivate<CR>', 'activate anyfold'},
    c = {':set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20<CR>', 'bring back cursor'},
    C = {':ColorizerToggle<CR>', 'colorizer toggle'},
    d = {':! ansible-vault decrypt %:p<CR>', 'ansible-vault decrypt'},
    D = {':! ansible-vault encrypt %:p<CR>', 'ansible-vault encrypt'},
    e = {':set ff=unix<CR>', 'set lf'},
    E = {':set ff=dos<CR>', 'set crlf'},
    f = {':Telescope filetypes<CR>', 'select from filetypes'},
    m = {':MarkdownPreview<CR>', 'markdown preview'},
    M = {':MarkdownPreviewStop<CR>', 'markdown preview stop'},
    i = {':IndentBlanklineToggle<CR>', 'indentation guides'},
    l = {':set nonumber!<CR>', 'line-numbers'},
    r = {':set norelativenumber!<CR>', 'relative line nums'},
    s = {':setlocal spell!<CR>', 'toggle spell check'},
    t = {':!' .. vim.g.lsp_servers_dir .. 'markdown-toc %:p --bullets="-" -i<CR>', 'markdown-toc'},
    T = {':TSHighlightCapturesUnderCursor<CR>', 'show treesitter theme color'},
    w = {':StripWhitespace<CR>', 'strip whitespace'},
    U = {':! cd ~/.config/nvim/ && git pull<CR>', 'update configuration via git'},
    R = {':! cd ~/.config/nvim/utils && bash install-latest-neovim.sh && bash install-lsp.sh clean<CR>', 'rebuild neovim'},
    L = {':! cd ~/.config/nvim/utils && bash install-lsp.sh<CR>', 'update lsp servers'}
  },

  -- buffer
  b = {
    name = '+buffer',
    b = {':BufferPick<CR>', 'pick buffer'},
    d = {':Bdelete<CR>', 'delete-buffer'},
    -- h = {':BufferFirst<CR>', 'first-buffer'},
    -- l = {':BufferLast<CR>', 'last buffer'},
    -- L = {':BufferOrderByLanguage<CR>', 'order by language'},
    -- D = {':BufferOrderByDirectory<CR>', 'order by directory'},
    -- f = {':Telescope tele_tabby list theme=get_dropdown<CR>', 'buffers-telescope'},
    f = {':CocCommand fzf-preview.AllBuffers --preview "bat --style=numbers --color=always --line-range :500 {}"<CR>', 'buffers-fzf'},
    s = {':edit #<CR>', 'jump between two last buffers'},
    S = {':w !sudo tee % > /dev/null<CR>', 'sudo save'},
    c = {':BufferClose!<CR>', 'close-this buffer'},
    C = {':BufferWipeout<CR>', 'close-all'},
    X = {':BufferCloseAllButCurrent<CR>', 'close-all but current'},
    p = {':BufferPin<CR>', 'pin buffer'},
    P = {':BufferCloseAllButPinned<CR>', 'close-all but pinned'},
    y = {':BufferCloseBuffersLeft<CR>', 'close-all to left'},
    Y = {':BufferCloseBuffersRight<CR>', 'close-all to right'}
  },

  -- debugger
  d = {
    name = '+debug',
    a = {'<Plug>VimspectorAddFunctionBreakpoint', 'function breakpoint'},
    b = {'<Plug>VimspectorToggleBreakpoint', 'breakpoint'},
    B = {'<Plug>VimspectorToggleConditionalBreakpoint', 'conditional breakpoint'},
    c = {'<Plug>VimspectorRunToCursor', 'run to cursor'},
    C = {':call vimspector#ClearBreakpoints()<CR>', 'clear all breakpoints'},
    d = {'<Plug>VimspectorContinue', 'continue'},
    f = {':Telescope vimspector configurations<CR>', 'configurations'},
    o = {'<Plug>VimspectorStepOver', 'step over'},
    O = {'<Plug>VimspectorStepOut', 'step out'},
    i = {'<Plug>VimspectorStepInto', 'step into'},
    k = {'<Plug>VimspectorBalloonEval', 'hover this'},
    p = {'<Plug>VimspectorPause', 'pause'},
    r = {'<Plug>VimspectorRestart', 'restart'},
    R = {':VimspectorReset<CR>', 'reset'},
    s = {'<Plug>VimspectorStop', 'stop'}
  },

  -- find
  f = {
    name = '+search',
    [';'] = {':Telescope commands<CR>', 'commands'},
    A = {':Telescope builtin<CR>', 'telescope list all command'},
    b = {':Telescope current_buffer_fuzzy_find<CR>', 'current buffer'},
    c = {':TodoTelescope<CR>', 'todo comments'},
    d = {':CocCommand fzf-preview.DirectoryFiles --preview "bat --style=numbers --color=always --line-range :500 {}"<CR>', 'files in directory'},
    f = {':Telescope oldfiles<CR>', 'file history'},
    h = {':History:<CR>', 'command history'},
    g = {':Telescope grep_string<CR>', 'grep string under cursor'},
    -- l = {':Lines<CR>', 'text in open buffers'},
    m = {':CocCommand fzf-preview.Bookmarks<CR>', 'list bookmarks'},
    j = {':CocCommand fzf-preview.Jumps --preview "bat --style=numbers --color=always --line-range :500 {}"<CR>', 'jumps'},
    k = {':Telescope keymaps<CR>', 'keymaps'},
    -- s = {':Telescope ultisnips ultisnips<CR>', 'snippets'},
    s = {':Telescope spell_suggest<CR>', 'spell suggest'},
    r = {':call RipgrepInteractive()<CR>', 'rg interactive'},
    p = {':Telescope find_files theme=get_dropdown<CR>', 'find file'},
    R = {':Telescope registers<CR>', 'registers'},
    t = {':Telescope live_grep<CR>', 'text-telescope'},
    -- T = {':Rg<CR>', 'all files for text ripgrep'},
    O = {':Telescope vim_options<CR>', 'vim options'}
    -- w = {':Windows<CR>', 'search windows'}
  },

  -- find and replace
  s = {
    name = '+find & replace',
    f = {':FindAndReplace<CR>', 'find and replace'},
    s = {':FindAndReplaceVisual<CR>', 'find this visual'},
    b = {':FindAndReplaceInBuffer<CR>', 'search in current buffer'}
  },

  g = {
    name = '+git',
    a = {':0Gclog<CR>', 'buffer commits'},
    b = {':Git blame<CR>', 'blame'},
    B = {':Telescope git_branches<CR>', 'branches'},
    c = {':GDiffCompare<CR>', 'compare with branch'},
    d = {':Gdiffsplit<CR>', 'diff split'},
    D = {':Git diff<CR>', 'diff'},
    e = {':Gedit<CR>', 'edit-version'},
    f = {':GFiles?<CR>', 'modified git files'},
    F = {':Telescope git_files<CR>', 'git_files'},
    h = {':GitSignsPreviewHunk<CR>', 'preview hunk'},
    n = {':GitSignsNextHunk<CR>', 'next hunk'},
    p = {':GitSignsPrevHunk<CR>', 'prev hunk'},
    m = {':Gdiffsplit<CR>', 'merge view'},
    M = {':Gvdiffsplit!<CR>', 'merge view, 3-way-split'},
    s = {':Git<CR>', 'status'},
    S = {':CocCommand fzf-preview.GitStatus<CR>', 'full status'},
    t = {':GitSignsToggle<CR>', 'toggle hunks'},
    U = {':GitSignsResetHunk<CR>', 'undo hunk'},
    v = {':Telescope git_bcommits<CR>', 'view buffer commits'},
    V = {':Telescope git_commits<CR>', 'view commits'}
  },

  -- gist
  G = {
    name = '+gist',
    f = {':CocList gist<CR>', 'list'},
    p = {':CocCommand gist.create<CR>', 'post gist'},
    I = {':Telescope gh issues<CR>', 'github issues'},
    P = {':Telescope gh pull_request<CR>', 'github pull requests'},
    U = {':CocCommand gist.update<CR>', 'github gists'}
  },

  -- lsp
  l = {
    name = '+lsp',
    a = {':Lspsaga code_action<CR>', 'code action'},
    A = {':Lspsaga range_code_action<CR>', 'selected action'},
    c = {':LspTroubleToggle<CR>', 'show all diagnostics'},
    d = {':Telescope lsp_document_diagnostics --theme=get_dropdown<CR>', 'document diagnostics'},
    D = {':Telescope lsp_workspace_diagnostics --theme=get_dropdown<CR>', 'workspace diagnostics'},
    f = {':LspFormattingSync<CR>', 'format'},
    F = {':LspFormatting<CR>', 'format-async'},
    h = {':LspHoverPreview<CR>', 'preview definition'},
    H = {':Lspsaga signature_help<CR>', 'signature help'},
    g = {':LspOrganizeImports<CR>', 'organize imports'},
    i = {':LspImplementation<CR>', 'implementation'},
    I = {':LspInfo<CR>', 'lsp information'},
    l = {':Lspsaga show_line_diagnostics<CR>', 'line diagnostics'},
    L = {':Lspsaga lsp_finder<CR>', 'lsp finder'},
    m = {':LspRenameFile<CR>', 'rename'},
    M = {':Telescope node_modules list<CR>', 'node modules'},
    n = {':Lspsaga diagnostic_jump_next<CR>', 'next diagnostic'},
    p = {':Lspsaga diagnostic_jump_prev<CR>', 'prev diagnostic'},
    o = {':SymbolsOutline<CR>', 'outline'},
    q = {':Telescope quickfix<CR>', 'quickfix'},
    r = {':LspReferences<CR>', 'references'},
    R = {':LspRename<CR>', 'rename item'},
    T = {':LspTypeDefinition<CR>', 'type defintion'},
    Q = {':LspRestart<CR>', 'restart currently active lsps'},
    s = {':Telescope lsp_document_symbols --theme=get_dropdown<CR>', 'document symbols'},
    S = {':Telescope lsp_workspace_symbols --theme=get_dropdown<CR>', 'workspace symbols'}
  },

  -- terminal
  t = {
    name = '+terminal',
    ['-'] = {':ToggleTerm<CR>', 'toggleterm'},
    ['.'] = {':FloatermNew --wintype=normal --height=15<CR>', 'terminal on bottom'},
    [','] = {':FloatermNew<CR>', 'terminal'},
    F = {':FloatermNew fzf<CR>', 'fzf'},
    g = {':FloatermNew lazygit<CR>', 'git'},
    d = {':FloatermNew lazydocker<CR>', 'docker'},
    r = {':FloatermNew ranger<CR>', 'ranger'},
    h = {':FloatermNew htop<CR>', 'htop'},
    n = {':FloatermNew ncdu<CR>', 'ncdu'},
    f = {':CocList floaterm<CR>', 'find terminal'},
    t = {':FloatermToggle<CR>', 'toggle'},
    s = {':FloattermShow<CR>', 'floaterm-show'},
    k = {':FloattermKill!<CR>', 'floaterm-kill-all'}
  },

  -- tasks
  T = {
    name = '+task',
    e = {':AsyncTaskEdit<CR>', 'edit local tasks'},
    g = {':AsyncTaskEdit!<CR>', 'edit global tasks'},
    f = {':Telescope asynctasks all<CR>', 'list tasks'},
    m = {':AsyncTaskMacro<CR>', 'macro help'},
    d = {':AsyncTask docker-compose-up<CR>', 'docker-compose up'},
    D = {':AsyncTask docker-compose-up-d<CR>', 'docker-compose up -d'}
  },

  -- workspace/session
  w = {
    name = '+Session',
    c = {':Dashboard<CR>', 'Dashboard'},
    Q = {':qa!<CR>', 'Quit'},
    l = {':SessionLoad<CR>', 'Load Session'},
    s = {':SessionSave<CR>', 'Save Session'},
    f = {':CocList sessions<CR>', 'List Session'}
  }
}, {prefix = '<Leader>'})

