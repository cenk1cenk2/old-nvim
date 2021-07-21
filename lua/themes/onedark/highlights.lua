local c = require('themes.onedark.colors')

local M = {}
local hl = {langs = {}, plugins = {}}

local highlight = vim.api.nvim_set_hl
local set_hl_ns = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local create_namespace = vim.api.nvim_create_namespace

local function load_highlights(ns, highlights)
  for group_name, group_settings in pairs(highlights) do highlight(ns, group_name, group_settings) end
end

local function gui(group_settings)
  if group_settings.bold then
    return 'bold'
  elseif group_settings.underline then
    return 'underline'
  elseif group_settings.italic then
    return 'italic'
  elseif group_settings.reverse then
    return 'reverse'
  else
    return 'NONE'
  end
end

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    local fg = group_settings.fg and 'guifg=' .. group_settings.fg or 'guifg=NONE'
    local bg = group_settings.bg and 'guibg=' .. group_settings.bg or 'guibg=NONE'
    vim.cmd('highlight ' .. group_name .. ' ' .. 'gui=' .. gui(group_settings) .. ' ' .. fg .. ' ' .. bg)
  end
end

local colors = {
  Fg = {fg = c.fg},
  Grey = {fg = c.grey},
  BrightGrey = {fg = c.bright_grey},
  Red = {fg = c.red},
  Cyan = {fg = c.cyan},
  Yellow = {fg = c.yellow},
  Orange = {fg = c.orange},
  Green = {fg = c.green},
  Blue = {fg = c.blue},
  Purple = {fg = c.purple},
  BrightYellow = {fg = c.bright_yellow},
  DarkCyan = {fg = c.dark_cyan}
}

hl.common = {
  Normal = {fg = c.fg, bg = c.bg0},
  Terminal = {fg = c.fg, bg = c.bg0},
  EndOfBuffer = {fg = c.bg0, bg = c.bg0},
  FoldColumn = {fg = c.fg, bg = c.bg2},
  Folded = {fg = c.fg, bg = c.bg2},
  SignColumn = {fg = c.fg, bg = c.bg0},
  ToolbarLine = {fg = c.fg},
  Cursor = {reverse = true},
  vCursor = {reverse = true},
  iCursor = {reverse = true},
  lCursor = {reverse = true},
  CursorIM = {reverse = true},
  CursorColumn = {bg = c.bg1},
  CursorLine = {bg = c.bg1},
  ColorColumn = {bg = c.bg1},
  CursorLineNr = {fg = c.fg},
  LineNr = {fg = c.grey},
  Conceal = {fg = c.grey, bg = c.bg1},
  DiffAdd = {fg = c.none, bg = c.diff_add},
  DiffChange = {fg = c.none, bg = c.diff_change},
  DiffDelete = {fg = c.none, bg = c.diff_delete},
  DiffText = {fg = c.none, bg = c.diff_text},
  DiffAdded = colors.Green,
  DiffRemoved = colors.Red,
  DiffFile = colors.Cyan,
  DiffIndexLine = colors.Grey,
  Directory = {fg = c.blue},
  ErrorMsg = {fg = c.red, bold = true, bg = c.bg0},
  WarningMsg = {fg = c.orange, bold = true, bg = c.bg0},
  MoreMsg = {fg = c.cyan, bold = true, bg = c.bg0},
  IncSearch = {bg = c.bg_d},
  Search = {bg = c.bg3},
  MatchParen = {fg = c.blue, underline = true},
  NonText = {fg = c.grey},
  Whitespace = {fg = c.grey},
  ExtraWhitespace = {bg = c.dark_red},
  SpecialKey = {fg = c.grey},
  Pmenu = {fg = c.fg, bg = c.bg1},
  PmenuSbar = {fg = c.none, bg = c.bg1},
  PmenuSel = {fg = c.bg0, bg = c.bg_blue},
  WildMenu = {fg = c.bg0, bg = c.blue},
  PmenuThumb = {fg = c.none, bg = c.grey},
  Question = {fg = c.yellow},
  SpellBad = {fg = c.red, underline = true, sp = c.red},
  SpellCap = {fg = c.yellow, underline = true, sp = c.yellow},
  SpellLocal = {fg = c.blue, underline = true, sp = c.blue},
  SpellRare = {fg = c.purple, underline = true, sp = c.purple},
  StatusLine = {fg = c.fg, bg = c.bg1},
  StatusLineTerm = {fg = c.bg0, bg = c.bg1},
  StatusLineNC = {fg = c.grey, bg = c.bg2},
  StatusLineTermNC = {fg = c.bg0, bg = c.bg2},
  TabLine = {fg = c.fg, bg = c.bg1},
  TabLineFill = {fg = c.grey, bg = c.bg0},
  TabLineSel = {fg = c.fg, bg = c.bg0},
  VertSplit = {fg = c.bg1},
  Visual = {bg = c.bg2},
  VisualNOS = {fg = c.none, bg = c.bg2},
  QuickFixLine = {fg = c.blue},
  Debug = {fg = c.yellow},
  debugPC = {fg = c.bg0, bg = c.cyan},
  debugBreakpoint = {fg = c.bg0, bg = c.red},
  ToolbarButton = {fg = c.bg0, bg = c.bg_blue}
}

hl.syntax = {
  String = colors.Green,
  Character = colors.Orange,
  NormalFloat = {bg = c.bg1},
  FloatBorder = {fg = c.grey},
  Number = colors.Orange,
  Float = colors.Orange,
  Boolean = colors.Orange,
  Type = colors.Yellow,
  Structure = colors.Yellow,
  StorageClass = colors.Yellow,
  Identifier = colors.Red,
  Constant = colors.Yellow,
  PreProc = colors.Purple,
  PreCondit = colors.Purple,
  Include = colors.Purple,
  Keyword = colors.Purple,
  Define = colors.Purple,
  Typedef = colors.Purple,
  Exception = colors.Purple,
  Conditional = colors.Purple,
  Repeat = colors.Purple,
  Statement = colors.Purple,
  Macro = colors.Red,
  Error = colors.Purple,
  Label = colors.Red,
  Special = colors.Red,
  SpecialChar = colors.Red,
  Function = colors.Blue,
  Operator = colors.Cyan,
  Title = colors.Cyan,
  Tag = colors.Green,
  Delimiter = colors.BrightGrey,
  Comment = {italic = true, fg = c.grey},
  SpecialComment = {italic = true, fg = c.grey},
  Todo = colors.Red
}

hl.treesitter = {
  TSAnnotation = colors.Fg,
  TSAttribute = colors.Cyan,
  TSBoolean = colors.Orange,
  TSCharacter = colors.Fg,
  TSComment = {fg = c.grey, italic = true},
  TSConditional = colors.Purple,
  TSConstant = colors.Yellow,
  TSConstBuiltin = colors.Orange,
  TSConstMacro = colors.Orange,
  TSConstructor = colors.Yellow,
  TSError = colors.Fg,
  TSException = colors.Purple,
  TSField = colors.Red,
  TSFloat = colors.Green,
  TSFunction = colors.Blue,
  TSFuncBuiltin = colors.Cyan,
  TSFuncMacro = colors.Fg,
  TSInclude = colors.Purple,
  TSKeyword = colors.Purple,
  TSKeywordFunction = colors.yellow,
  TSKeywordOperator = colors.Purple,
  TSLabel = colors.Red,
  TSMethod = colors.Blue,
  TSNamespace = colors.Red,
  TSNone = colors.Fg,
  TSNumber = colors.Orange,
  TSOperator = colors.Cyan,
  TSParameter = colors.Red,
  TSParameterReference = colors.Fg,
  TSProperty = colors.Red,
  TSPunctDelimiter = colors.Fg,
  TSPunctBracket = colors.BrightYellow,
  TSPunctSpecial = colors.Purple,
  TSRepeat = colors.Purple,
  TSString = colors.Green,
  TSStringRegex = colors.Orange,
  TSStringEscape = colors.Red,
  TSSymbol = colors.Cyan,
  TSTag = colors.Red,
  TSTagDelimiter = colors.BrightGrey,
  TSText = colors.Fg,
  TSStrong = colors.Fg,
  TSEmphasis = colors.Fg,
  TSUnderline = colors.Fg,
  TSStrike = colors.Fg,
  TSTitle = colors.Fg,
  TSLiteral = colors.Green,
  TSURI = colors.Fg,
  TSMath = colors.Fg,
  TSTextReference = colors.Fg,
  TSEnviroment = colors.Fg,
  TSEnviromentName = colors.Fg,
  TSNote = colors.Fg,
  TSWarning = colors.Fg,
  TSDanger = colors.Fg,
  TSType = colors.Yellow,
  TSTypeBuiltin = colors.Yellow,
  TSVariable = colors.Red,
  TSVariableBuiltin = colors.Yellow
}

hl.plugins.lsp = {
  LspDiagnosticsDefaultError = {fg = c.red},
  LspDiagnosticsDefaultHint = {fg = c.blue},
  LspDiagnosticsDefaultInformation = {fg = c.grey},
  LspDiagnosticsDefaultWarning = {fg = c.yellow},
  LspDiagnosticsUnderlineError = {sp = c.red},
  LspDiagnosticsUnderlineHint = {sp = c.blue, bold = true},
  LspDiagnosticsUnderlineInformation = {sp = c.grey, bold = true},
  LspDiagnosticsUnderlineWarning = {sp = c.yellow, bold = true},
  LspDiagnosticsVirtualTextError = {fg = c.red},
  LspDiagnosticsVirtualTextWarning = {fg = c.yellow},
  LspDiagnosticsVirtualTextInformation = {fg = c.grey},
  LspDiagnosticsVirtualTextHint = {fg = c.blue},
  LspReferenceText = {bg = c.bg1},
  LspReferenceWrite = {bg = c.bg1},
  LspReferenceRead = {bg = c.bg1}
}

hl.plugins.whichkey = {WhichKey = colors.Red, WhichKeyDesc = colors.Blue, WhichKeyGroup = colors.Orange, WhichKeySeperator = colors.Green, WhichKeyFloat = {bg = c.bg1}}

hl.plugins.gitgutter = {GitGutterAdd = {fg = c.bright_green}, GitGutterChange = {fg = c.bright_cyan}, GitGutterDelete = {fg = c.bright_red}}

hl.plugins.hop = {HopNextKey = {fg = c.bg0, bg = c.orange}, HopNextKey1 = {fg = c.bg0, bg = c.orange}, HopNextKey2 = {fg = c.bg0, bg = c.bg_yellow}, HopUnmatched = {}}

hl.plugins.indentblankline = {IndentBlankLineChar = {fg = c.bg3}, IndentBlanklineContextChar = {fg = c.cursor}}

hl.plugins.diffview = {
  DiffviewFilePanelTitle = {fg = c.blue, bold = true},
  DiffviewFilePanelCounter = {fg = c.purple, bold = true},
  DiffviewFilePanelFileName = colors.Fg,
  DiffviewNormal = hl.common.Normal,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.EndOfBuffer,
  DiffviewFilePanelRootPath = colors.Grey,
  DiffviewFilePanelPath = colors.Grey,
  DiffviewFilePanelInsertions = colors.Green,
  DiffviewFilePanelDeletions = colors.Red,
  DiffviewStatusAdded = colors.Green,
  DiffviewStatusUntracked = colors.Blue,
  DiffviewStatusModified = colors.Blue,
  DiffviewStatusRenamed = colors.Blue,
  DiffviewStatusCopied = colors.Blue,
  DiffviewStatusTypeChange = colors.Blue,
  DiffviewStatusUnmerged = colors.Blue,
  DiffviewStatusUnknown = colors.Red,
  DiffviewStatusDeleted = colors.Red,
  DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
  GitSignsAdd = colors.Green,
  GitSignsAddLn = colors.Green,
  GitSignsAddNr = colors.Green,
  GitSignsChange = colors.Blue,
  GitSignsChangeLn = colors.Blue,
  GitSignsChangeNr = colors.Blue,
  GitSignsDelete = colors.Red,
  GitSignsDeleteLn = colors.Red,
  GitSignsDeleteNr = colors.Red
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = {fg = c.fg, bg = c.bg0},
  NvimTreeEndOfBuffer = {fg = c.bg0, bg = c.bg0},
  NvimTreeRootFolder = {fg = c.purple, bold = true},
  NvimTreeGitDirty = colors.Orange,
  NvimTreeGitNew = colors.Green,
  NvimTreeGitDeleted = colors.Red,
  NvimTreeSpecialFile = {fg = c.yellow, bold = true},
  NvimTreeIndentMarker = colors.Fg,
  NvimTreeImageFile = {fg = c.dark_purple},
  NvimTreeSymlink = colors.Purple,
  NvimTreeFolderName = colors.Blue
}

hl.plugins.telescope = {
  TelescopeBorder = colors.Grey,
  TelescopeMatching = colors.Green,
  TelescopePromptPrefix = colors.Blue,
  TelescopeSelection = {bg = c.bg2},
  TelescopeSelectionCaret = colors.Blue
}

hl.plugins.dashboard = {DashboardShortcut = {fg = c.fg}, DashboardHeader = colors.Green, DashboardCenter = {fg = c.yellow}, DashboardFooter = {fg = c.grey, bold = true}}

hl.plugins.spectre = {SpectreChange = {fg = c.yellow}, SpectreDelete = {fg = c.red}}

hl.langs.markdown = {
  markdownBlockquote = colors.Grey,
  markdownBold = {fg = c.none, bold = true},
  markdownBoldDelimiter = colors.Grey,
  markdownCode = colors.Yellow,
  markdownCodeBlock = colors.Yellow,
  markdownCodeDelimiter = colors.Green,
  markdownH1 = {fg = c.red, bold = true},
  markdownH2 = {fg = c.red, bold = true},
  markdownH3 = {fg = c.red, bold = true},
  markdownH4 = {fg = c.red, bold = true},
  markdownH5 = {fg = c.red, bold = true},
  markdownH6 = {fg = c.red, bold = true},
  markdownHeadingDelimiter = colors.Grey,
  markdownHeadingRule = colors.Grey,
  markdownId = colors.Yellow,
  markdownIdDeclaration = colors.Red,
  markdownItalic = {fg = c.none, italic = true},
  markdownItalicDelimiter = {fg = c.grey, italic = true},
  markdownLinkDelimiter = colors.Grey,
  markdownLinkText = colors.Red,
  markdownLinkTextDelimiter = colors.Grey,
  markdownListMarker = colors.Red,
  markdownOrderedListMarker = colors.Red,
  markdownRule = colors.Purple,
  markdownUrl = {fg = c.blue, underline = true},
  markdownUrlDelimiter = colors.Grey,
  markdownUrlTitleDelimiter = colors.Green
}

hl.langs.gitcommit = {
  gitcommitComment = {fg = c.grey},
  gitcommitUnmerged = {fg = c.green},
  gitcommitOnBranch = {},
  gitcommitBranch = {fg = c.yellow},
  gitcommitDiscardedType = {fg = c.red},
  gitcommitSelectedType = {fg = c.green},
  gitcommitHeader = {},
  gitcommitUntrackedFile = {fg = c.cyan},
  gitcommitDiscardedFile = {fg = c.red},
  gitcommitSelectedFile = {fg = c.green},
  gitcommitUnmergedFile = {fg = c.yellow},
  gitcommitFile = {},
  gitcommitSummary = {fg = c.fg},
  gitcommitOverflow = {fg = c.red},
  gitcommitNoBranch = {fg = c.yellow},
  gitcommitUntracked = {fg = c.cyan},
  gitcommitDiscarded = {fg = c.red},
  gitcommitSelected = {fg = c.green},
  gitcommitDiscardedArrow = {fg = c.red},
  gitcommitSelectedArrow = {fg = c.green},
  gitcommitUnmergedArrow = {fg = c.yellow}
}

hl.langs.yaml = {yamlBlockCollectionItemStart = colors.Fg, yamlKeyValueDelimiter = colors.Fg}

hl.langs.dockerCompose = {dockercomposeKeywords = colors.Red}

hl.langs.bash = {bashTSParameter = {fg = c.fg}}

function M.setup()
  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  local ns = create_namespace('onedark')
  load_highlights(ns, hl.treesitter)
  set_hl_ns(ns)
  for _, group in pairs(hl.langs) do vim_highlights(group) end
  for _, group in pairs(hl.plugins) do vim_highlights(group) end
end

return M

