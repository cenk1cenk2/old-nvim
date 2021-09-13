require('lsp-language-configurations.bash')
require('lsp-language-configurations.css')
require('lsp-language-configurations.docker')
require('lsp-language-configurations.go')
require('lsp-language-configurations.json')
require('lsp-language-configurations.lsp')
require('lsp-language-configurations.lua')
require('lsp-language-configurations.rust')
require('lsp-language-configurations.python')
require('lsp-language-configurations.tsserver')
require('lsp-language-configurations.vim')
require('lsp-language-configurations.vue')
require('lsp-language-configurations.yaml')
require('lsp-language-configurations.ansible')

-- extensions
require('lsp-language-configurations.html')
require('lsp-language-configurations.tailwind')
require('lsp-language-configurations.stylelint')
require('lsp-language-configurations.graphql')

-- this is at the end due to priority
require('lsp-language-configurations.eslint')

-- formatter priority
require('lsp-language-configurations.efm')

-- spellcheck, least priority
-- require('lsp-language-configurations.grammarly')

require('nlspsettings').setup({config_home = vim.fn.stdpath('config') .. '/lua/lsp-language-configurations/nlsp'})
