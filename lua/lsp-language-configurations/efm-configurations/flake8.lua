return {
  lintCommand = vim.g.lsp_servers_dir .. 'flake8 --max-line-length 160 --stdin-display-name ${INPUT} -',
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = {'%f=%l:%c: %m'}
}
