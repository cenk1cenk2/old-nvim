return {
  lintCommand = vim.g.lsp_settings_servers_dir .. 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
  lintIgnoreExitCode = true,
formatCommand = vim.g.lsp_settings_servers_dir .. 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true
}
