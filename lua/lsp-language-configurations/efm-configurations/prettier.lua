-- return {formatCommand = ..vim.g.lsp_servers_dir .. 'prettierd ${INPUT}', formatStdin = true}
return {
  -- formatCommand = 'prettier --config-precedence file-override --single-quote --print-width 180 --bracket-spacing --arrow-parens always --end-of-line lf --no-semi --stdin-filepath=${INPUT}',
  formatCommand = 'PRETTIERD_DEFAULT_CONFIG=~/.config/nvim/utils/linter-config/.prettierrc.json node ' .. vim.g.lsp_servers_dir .. 'prettierd ${INPUT}',
  formatStdin = true
}
