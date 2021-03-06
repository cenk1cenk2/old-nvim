vim.fn.sign_define('LspDiagnosticsSignError', {text = '', numhl = 'LspDiagnosticsDefaultError'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'LspDiagnosticsDefaultWarning'})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'LspDiagnosticsDefaultInformation'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'LspDiagnosticsDefaultHint'})

vim.api.nvim_set_keymap('n', 'gf', ':LspDefinition<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'ge', ':LspDeclaration<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gr', ':LspReferences<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gi', ':LspImplementation<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'K', ':LspHover<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':LspGoToNext<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':LspGoToPrev<CR>', {silent = true, noremap = true})

