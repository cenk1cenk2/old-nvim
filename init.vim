"    ____      _ __        _
  " /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

if !exists('g:vscode')
  source ~/.config/nvim/plug-config/polyglot.vim
endif

" General Settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

" general plugins
source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/highlightyank.vim
source $HOME/.config/nvim/plug-config/surround.vim

if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
else
  " Themes
  source $HOME/.config/nvim/themes/syntax.vim
  source $HOME/.config/nvim/themes/onedark.vim

  " Plugin Configuration
<<<<<<< HEAD
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/better-whitespace.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/vim-wiki.vim
  luafile $HOME/.config/nvim/lua/nvcodeline.lua
  luafile $HOME/.config/nvim/lua/treesitter.lua
  source $HOME/.config/nvim/plug-config/coc/coc.vim
  source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
  source $HOME/.config/nvim/plug-config/goyo.vim
  source $HOME/.config/nvim/plug-config/vim-rooter.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim
  source $HOME/.config/nvim/plug-config/git-messenger.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/barbar.vim
  source $HOME/.config/nvim/plug-config/far.vim
  source $HOME/.config/nvim/plug-config/tagalong.vim
  source $HOME/.config/nvim/plug-config/bracey.vim
  source $HOME/.config/nvim/plug-config/asynctask.vim
  source $HOME/.config/nvim/plug-config/window-swap.vim
  source $HOME/.config/nvim/plug-config/markdown-preview.vim
  source $HOME/.config/nvim/plug-config/neovide.vim
  luafile $HOME/.config/nvim/lua/plug-colorizer.lua
  luafile $HOME/.config/nvim/lua/config-telescope.lua
  source $HOME/.config/nvim/plug-config/vimspector.vim
  source $HOME/.config/nvim/plug-config/nerd-tree.vim
  source $HOME/.config/nvim/plug-config/nerd-commenter.vim
  source $HOME/.config/nvim/plug-config/anyfold.vim
  source $HOME/.config/nvim/plug-config/maximizer.vim
  source $HOME/.config/nvim/plug-config/peekaboo.vim
  source $HOME/.config/nvim/plug-config/shellfmt.vim
  source $HOME/.config/nvim/plug-config/auto-pairs.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  luafile $HOME/.config/nvim/lua/rainbow.lua
  source $HOME/.config/nvim/plug-config/fzf-preview.vim
  source $HOME/.config/nvim/plug-config/jinja.vim
  source $HOME/.config/nvim/plug-config/fugitive.vim
  source $HOME/.config/nvim/plug-config/vim-go.vim
  source $HOME/.config/nvim/plug-config/vim-bookmarks.vim
  source $HOME/.config/nvim/plug-config/vim-mergetool.vim
  source $HOME/.config/nvim/plug-config/skylight.vim
  source $HOME/.config/nvim/plug-config/easy-align.vim
  source $HOME/.config/nvim/plug-config/indent-guides.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source ~/.config/nvim/plug-config/nvimtree-config.vim
  source ~/.config/nvim/plug-config/lsp-saga.vim
  source ~/.config/nvim/plug-config/lightbulb.vim
  source ~/.config/nvim/lua/lsp-wrapper.vim
  luafile ~/.config/nvim/lua/plugins/galaxyline-config.lua
  luafile ~/.config/nvim/lua/plugins/nvimtree-config.lua
  luafile ~/.config/nvim/lua/plugins/treesitter-config.lua
  luafile ~/.config/nvim/lua/plugins/colorizer-config.lua
  luafile ~/.config/nvim/lua/plugins/telescope-config.lua
  luafile ~/.config/nvim/lua/lsp/lsp-kind.lua
  luafile ~/.config/nvim/lua/plugins/compe-config.lua
  luafile ~/.config/nvim/lua/plugins/lspsaga-config.lua
  " LSP: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  source ~/.config/nvim/plug-config/lsp-config.vim
  luafile ~/.config/nvim/lua/lsp/lsp-config.lua
  luafile ~/.config/nvim/lua/lsp/lua-ls.lua
  luafile ~/.config/nvim/lua/lsp/python-ls.lua
  luafile ~/.config/nvim/lua/lsp/bash-ls.lua
  luafile ~/.config/nvim/lua/lsp/css-ls.lua
  luafile ~/.config/nvim/lua/lsp/docker-ls.lua
  luafile ~/.config/nvim/lua/lsp/graphql-ls.lua
  luafile ~/.config/nvim/lua/lsp/html-ls.lua
  luafile ~/.config/nvim/lua/lsp/javascript-ls.lua
  luafile ~/.config/nvim/lua/lsp/json-ls.lua
  luafile ~/.config/nvim/lua/lsp/vim-ls.lua
  luafile ~/.config/nvim/lua/lsp/yaml-ls.lua
endif

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
