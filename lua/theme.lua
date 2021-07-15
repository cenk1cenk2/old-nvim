local helpers = require('helper-functions')

vim.g.onedark_hide_endofbuffer = 1
vim.g.onedark_terminal_italics = 1
vim.g.onedark_termcolors = 256

vim.api.nvim_command([[syntax on]])
vim.api.nvim_command([[colorscheme onedark]])
vim.api.nvim_command([[set termguicolors]])

helpers.theme.add_highlight({
  -- general vim stuff
  ['Normal'] = {guifg = '#abb2bf', ctermfg = 249, guibg = '#1e2127', ctermbg = 235, gui = 'NONE', cterm = 'NONE'},
  ['Cursor'] = {guibg = '#6c778d'},
  ['Comment'] = {cterm = 'italic'},
  ['CursorLine'] = {guibg = '#22282f'},
  ['Visual'] = {guibg = '#38404b', gui = 'NONE'},
  ['Float'] = {guifg = '#d19a66', ctermfg = 173, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['Terminal'] = {guifg = '#abb2bf', ctermfg = 249, guibg = '#1e1e1e', ctermbg = 234, gui = 'NONE', cterm = 'NONE'},
  ['EndOfBuffer'] = {guifg = '#1e1e1e', ctermfg = 234, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['TabLine'] = {guifg = '#5c6370', ctermfg = 241, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['TabLineSel'] = {guifg = '#abb2bf', ctermfg = 249, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['TabLineFill'] = {guifg = 'NONE', ctermfg = 'NONE', guibg = '#1e2127', ctermbg = 235, gui = 'NONE', cterm = 'NONE'},
  ['LineNr'] = {guifg = '#4b5263', ctermfg = 240, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['SignColumn'] = {guifg = 'NONE', ctermfg = 'NONE', guibg = '#1e2127', ctermbg = 235, gui = 'NONE', cterm = 'NONE'},
  ['MatchParen'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'underline', cterm = 'underline'},
  ['Delimiter'] = {guifg = '#b0b0b0'},
  ['IncSearch'] = {guifg = '#e5c07b', ctermfg = 180, guibg = '#5c6370', ctermbg = 241, gui = 'NONE', cterm = 'NONE'},
  ['NormalFloat'] = {guibg = '#292c32', ctermfg = 75, ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},

  -- git related
  ['GitGutterAdd'] = {guifg = '#587C0C', ctermfg = 2},
  ['GitGutterChange'] = {guifg = '#0C7D9D', ctermfg = 3},
  ['GitGutterDelete'] = {guifg = '#94151B', ctermfg = 1},

  ['diffAdded'] = {guibg = '#98c379', guifg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['diffRemoved'] = {guibg = '#e06c75', guifg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['diffFileId'] = {guifg = '#61afef', guibg = 'NONE', gui = 'bold,reverse', cterm = 'bold,reverse'},
  ['diffFile'] = {guifg = '#3b4048', guibg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['diffNewFile'] = {guifg = '#98c379', guibg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['diffOldFile'] = {guifg = '#e06c75', guibg = 'NONE', gui = 'NONE', cterm = 'NONE'},

  -- git diff
  ['DiffAdd'] = {guibg = '#2e3a24', guifg = 'NONE', gui = 'NONE'},
  ['DiffChange'] = {guibg = '#2e2619', guifg = 'NONE', gui = 'NONE'},
  ['DiffDelete'] = {guibg = '#432023', guifg = 'NONE', gui = 'NONE'},
  ['DiffText'] = {guibg = '#453a25', guifg = 'NONE', gui = 'NONE'},

  -- startify
  ['StartifyNumber'] = {guifg = '#d19a66', ctermfg = 173, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifySelect'] = {guifg = '#98c379', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifyBracket'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifySpecial'] = {guifg = '#56b6c2', ctermfg = 73, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifyVar'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifyPath'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifyFile'] = {guifg = '#e06c75', ctermfg = 168, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifySlash'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifyHeader'] = {guifg = '#98c379', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifySection'] = {guifg = '#c586c0', ctermfg = 175, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['StartifyFooter'] = {guifg = '#98c379', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},

  -- which key
  ['WhichKey'] = {guifg = '#c586c0', ctermfg = 175, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['WhichKeySeperator'] = {guifg = '#98c379', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['WhichKeyGroup'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['WhichKeyDesc'] = {guifg = '#61afef', ctermfg = 75, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['WhichKeyFloat'] = {guibg = '#292c32', ctermfg = 75, ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},

  -- debugging
  ['debugPc'] = {guifg = 'NONE', ctermfg = 'NONE', guibg = '#56b6c2', ctermbg = 73, gui = 'NONE', cterm = 'NONE'},
  ['debugBreakpoint'] = {guifg = '#e06c75', ctermfg = 168, guibg = 'NONE', ctermbg = 'NONE', gui = 'reverse', cterm = 'reverse'},

  -- indent indent-blankline
  ['IndentBlankLineChar'] = {guifg = '#292c32', gui = 'nocombine'},
  ['IndentBlanklineContextChar'] = {guifg = '#484B50', gui = 'nocombine'},

  -- spectre
  ['SpectreChange'] = {guifg = '#e5c07b', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'underline', cterm = 'underline'},
  ['SpectreDelete'] = {guifg = '#98c379', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'underline', cterm = 'underline'},

  -- treesitter
  ['TSFloat'] = {guifg = '#98c379', ctermfg = 114, guibg = 'NONE', ctermbg = 'NONE', gui = 'NONE', cterm = 'NONE'},
  ['TSType'] = {guifg = '#e5c07b'},
  ['TSNamespace'] = {guifg = '#e06c75'},
  ['TSTypeBuiltin'] = {guifg = '#e5c07b'},
  ['TSProperty'] = {guifg = '#e06c75'},
  ['TSVariable'] = {guifg = '#e06c75'},
  ['TSParameter'] = {guifg = '#e06c75'},
  ['TSKeyword'] = {guifg = '#c678dd'},
  ['TSInclude'] = {guifg = '#c678dd'},
  ['TSConstructor'] = {guifg = '#e5c07b'},
  ['TSConstant'] = {guifg = '#e5c07b'},
  ['TSKeywordOperator'] = {guifg = '#c678dd'},
  ['TSMethod'] = {guifg = '#61afef'},
  ['TSOperator'] = {guifg = '#56b6c2'},
  ['TSLabel'] = {guifg = '#e06c75'},
  ['TSPunctSpecial'] = {guifg = '#c678dd'},
  ['TSTagDelimiter'] = {guifg = '#b0b0b0'},
  ['TSDelimiter'] = {guifg = '#b0b0b0'},
  ['TSPunctBracket'] = {guifg = '#FFD700'},
  ['TSVariableBuiltin'] = {guifg = '#e5c07b'},
  ['TSTag'] = {guifg = '#e06c75'},
  ['TSKeywordFunction'] = {guifg = '#e5c07b'},
  ['htmlTSTag'] = {guifg = '#e06c75'},
  ['htmlTSProperty'] = {guifg = '#e5c07b'},
  ['htmlTSNone'] = {guifg = 'b0b0b0'},
  ['htmlTSString'] = {guifg = '#98c379'}
})
