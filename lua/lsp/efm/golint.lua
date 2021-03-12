return {
    lintCommand = vim.g.lsp_settings_servers_dir .. "golint",
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %m"}
}
