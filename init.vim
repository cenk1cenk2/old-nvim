"    ____      _ __        _
  " /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

if !exists('g:vscode')
  source ~/.config/nvim/plug-config/polyglot.vim
endif

" General Settings
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim
source ~/.config/nvim/general/theme.vim
source ~/.config/nvim/keys/mappings.vim

" general plugins
source ~/.config/nvim/plug-config/easymotion.vim
source ~/.config/nvim/plug-config/highlightyank.vim
source ~/.config/nvim/plug-config/surround.vim

if exists('g:vscode')
  " VS Code extension
  source ~/.config/nvim/vscode/settings.vim
else
  " Themes
  source ~/.config/nvim/general/onedark.vim

  " Plugin Configuration
  source ~/.config/nvim/keys/which-key.vim
  source ~/.config/nvim/plug-config/rnvimr.vim
  source ~/.config/nvim/plug-config/better-whitespace.vim
  source ~/.config/nvim/plug-config/fzf.vim
  source ~/.config/nvim/plug-config/coc/coc-extensions.vim
  source ~/.config/nvim/plug-config/easymotion.vim
  source ~/.config/nvim/plug-config/vim-rooter.vim
  source ~/.config/nvim/plug-config/start-screen.vim
  source ~/.config/nvim/plug-config/gitgutter.vim
  source ~/.config/nvim/plug-config/git-messenger.vim
  source ~/.config/nvim/plug-config/closetags.vim
  source ~/.config/nvim/plug-config/floaterm.vim
  source ~/.config/nvim/plug-config/barbar.vim
  source ~/.config/nvim/plug-config/far.vim
  source ~/.config/nvim/plug-config/tagalong.vim
  source ~/.config/nvim/plug-config/asynctask.vim
  source ~/.config/nvim/plug-config/window-swap.vim
  source ~/.config/nvim/plug-config/markdown-preview.vim
  source ~/.config/nvim/plug-config/vimspector.vim
  source ~/.config/nvim/plug-config/nerd-tree.vim
  source ~/.config/nvim/plug-config/nerd-commenter.vim
  source ~/.config/nvim/plug-config/anyfold.vim
  source ~/.config/nvim/plug-config/maximizer.vim
  source ~/.config/nvim/plug-config/peekaboo.vim
  source ~/.config/nvim/plug-config/auto-pairs.vim
  " source ~/.config/nvim/plug-config/rainbow.vim
  source ~/.config/nvim/plug-config/fzf-preview.vim
  source ~/.config/nvim/plug-config/jinja.vim
  source ~/.config/nvim/plug-config/fugitive.vim
  source ~/.config/nvim/plug-config/vim-go.vim
  source ~/.config/nvim/plug-config/skylight.vim
  source ~/.config/nvim/plug-config/easy-align.vim
  source ~/.config/nvim/plug-config/indent-guides.vim
  source ~/.config/nvim/plug-config/quickscope.vim
  source ~/.config/nvim/plug-config/nvimtree-config.vim
  source ~/.config/nvim/plug-config/lsp-saga.vim
  source ~/.config/nvim/plug-config/lightbulb.vim
  source ~/.config/nvim/lua/lsp-wrapper.vim
  source ~/.config/nvim/plug-config/lsp-config.vim
  luafile ~/.config/nvim/lua/plugins/galaxyline-config.lua
  luafile ~/.config/nvim/lua/plugins/nvimtree-config.lua
  luafile ~/.config/nvim/lua/plugins/treesitter-config.lua
  luafile ~/.config/nvim/lua/plugins/colorizer-config.lua
  luafile ~/.config/nvim/lua/plugins/telescope-config.lua
  " lsp core
  source ~/.config/nvim/plug-config/lsp-compe.vim
  luafile ~/.config/nvim/lua/lsp-kind.lua
  luafile ~/.config/nvim/lua/plugins/compe-config.lua
  luafile ~/.config/nvim/lua/plugins/lspsaga-config.lua
  source ~/.config/nvim/plug-config/lsp-config.vim
  luafile ~/.config/nvim/lua/lsp-config.lua
  luafile ~/.config/nvim/lua/lsp-settings.lua
  " LSP: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  luafile ~/.config/nvim/lua/lsp/efm.lua
  luafile ~/.config/nvim/lua/lsp/tsserver.lua
  luafile ~/.config/nvim/lua/lsp/json.lua
  luafile ~/.config/nvim/lua/lsp/vim.lua
  luafile ~/.config/nvim/lua/lsp/bash.lua
  luafile ~/.config/nvim/lua/lsp/yaml.lua
  luafile ~/.config/nvim/lua/lsp/python.lua
  luafile ~/.config/nvim/lua/lsp/html.lua
  luafile ~/.config/nvim/lua/lsp/graphql.lua
  luafile ~/.config/nvim/lua/lsp/docker.lua
  luafile ~/.config/nvim/lua/lsp/css.lua
  luafile ~/.config/nvim/lua/lsp/go.lua
  luafile ~/.config/nvim/lua/lsp/vue.lua
  autocmd FileType java luafile ~/.config/nvim/lua/lsp/java-ls.lua
endif

" Add paths to node and python here
if !empty(glob('~/.config/nvim/paths.vim'))
  source ~/.config/nvim/paths.vim
endif
