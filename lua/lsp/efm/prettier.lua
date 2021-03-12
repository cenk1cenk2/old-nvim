return {
    formatCommand = vim.g.lsp_settings_servers_dir .. 'prettier ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma} --parser json'
}
