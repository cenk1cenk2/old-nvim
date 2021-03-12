return {
    lintCommand = vim.g.lsp_settings_servers_dir .. 'shellcheck -f gcc -x -',
    lintStdin = true,
  lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"}
}
