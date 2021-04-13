vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_filetype_exclude = {'startify', 'far', 'gitcommit', 'terminal', 'floaterm', 'NvimTree', 'dashboard'}
vim.g.indent_blankline_enabled = true
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_char = '┆'
vim.g.indent_blankline_space_char_highlight_list = {}
vim.g.indent_blankline_context_patterns = {
  'class',
  'return',
  'function',
  'method',
  '^if',
  '^while',
  'jsx_element',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments',
  'if_statement',
  'else_clause',
  'jsx_element',
  'jsx_self_closing_element',
  'try_statement',
  'catch_clause',
  'import_statement',
  'operation_type'
}
