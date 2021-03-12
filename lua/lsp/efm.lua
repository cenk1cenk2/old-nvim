local vint = require "lsp/efm/vint"
-- local luafmt = require "efm/luafmt"
local golint = require "lsp/efm/golint"
local goimports = require "lsp/efm/goimports"
local markdownlint = require "lsp/efm/markdownlint"
local black = require "lsp/efm/black"
local isort = require "lsp/efm/isort"
local flake8 = require "lsp/efm/flake8"
local mypy = require "lsp/efm/mypy"
local prettier = require 'lsp/efm/prettier'
local eslint = require 'lsp/efm/eslint'
local shellcheck = require "lsp/efm/shellcheck"
local shfmt = require "lsp/efm/shfmt"
local misspell = require "lsp/efm/misspell"

-- https://github.com/mattn/efm-langserver
require('lspconfig').efm.setup{
    cmd = {vim.g.lsp_settings_servers_dir .. 'efm-langserver', "-logfile", "/tmp/efm.log", "-loglevel", "1"},
    on_attach =  function(client)
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
            vim.api.nvim_command [[augroup END]]
        end
    end,
    init_options = {documentFormatting = true, codeAction = true},
    filetypes = {'=','sh','vim','go','python','typescript', 'javascript','typescriptreact' ,'javascriptreact','vue','yaml','json', 'html', 'scss', 'css', 'markdown'},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            ["="] = {misspell},
            sh = {shfmt, shellcheck},
            vim = {vint},
            lua = {luafmt},
            go = {golint, goimports},
            python = {black, isort, flake8, mypy},
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            vue = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {prettier,markdownlint},
        }
    }
}
