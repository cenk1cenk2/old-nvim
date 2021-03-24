local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')
local lspinstall = require('lspinstall')
local servers = require('lspinstall.servers')
local lsp_install_helpers = require('helper-functions.lsp-install')

-- Check if it's already defined for when reloading this file.
-- if not lspconfig.tailwind then
--   configs.tailwind = {
--     default_config = {
--       cmd = {'node', vim.g.lsp_servers_dir .. 'tailwindcss-language-server/index.js', '--stdio'},
--       filetypes = {'vue'},
--       root_dir = function(fname)
--         return util.root_pattern('tsconfig.json')(fname) or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
--       end,
--       log_level = vim.lsp.protocol.MessageType.Log,
--       settings = {},
--       handlers = {
--         ['tailwindcss/getConfiguration'] = function(_, _, params, _, bufnr, _)
--           -- tailwindcss lang server waits for this response before providing hover
--           vim.lsp.buf_notify(bufnr, 'tailwindcss/getConfigurationResponse', {_id = params._id})
--         end
--       }
--     }
--   }
-- end

local config = servers.tailwindcss
config.default_config.cmd[1] = {'node', vim.g.lsp_servers_dir .. 'tailwindcss-language-server/index.js', '--stdio'}

-- 2. extend the config with an install_script and (optionally) uninstall_script
servers.tailwindcss = vim.tbl_extend('force', config, {
  -- lspinstall will automatically create/delete the install directory for every server
  install_script = lsp_install_helpers.install_vscode_extension(
    '$(curl -s https://api.github.com/repos/tailwindlabs/tailwindcss-intellisense/releases/latest | grep "browser_" | cut -d\" -f4)"', 'tailwindcss-language-server',
    'extension/dist/server'),
  uninstall_script = nil -- can be omitted
})

-- lspconfig.tailwind.setup()
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do require'lspconfig'[server].setup {} end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
