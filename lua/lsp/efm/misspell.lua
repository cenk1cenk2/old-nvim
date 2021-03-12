return {
    lintCommand = vim.g.lsp_settings_servers_dir .. "misspell",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
