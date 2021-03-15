return {
  lintCommand = vim.g.lsp_servers_dir .. 'markdownlint -s -c ~/.config/nvim/config/.markdownlintrc.json',
  lintStdin = true,
  lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'},
  lintIgnoreExitCode = true
  -- formatCommand = vim.g.lsp_servers_dir .. 'markdownlint -c ~/.config/nvim/config/.markdownlintrc.json --fix ${INPUT}',
  -- formatStdin = false
}
