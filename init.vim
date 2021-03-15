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
source ~/.config/nvim/keys/mappings.vim

" general plugins
source ~/.config/nvim/plug-config/easymotion.vim
source ~/.config/nvim/plug-config/highlightyank.vim

if exists('g:vscode')
  " VS Code extension
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
  source ~/.config/nvim/plug-config/closetags.vim
  source ~/.config/nvim/plug-config/floaterm.vim
  source ~/.config/nvim/plug-config/barbar.vim
  source ~/.config/nvim/plug-config/far.vim
  source ~/.config/nvim/plug-config/tagalong.vim
  source ~/.config/nvim/plug-config/asynctask.vim
  source ~/.config/nvim/plug-config/window-swap.vim
  source ~/.config/nvim/plug-config/markdown-preview.vim
  source ~/.config/nvim/plug-config/vimspector.vim
  source ~/.config/nvim/plug-config/nerd-commenter.vim
  source ~/.config/nvim/plug-config/anyfold.vim
  source ~/.config/nvim/plug-config/maximizer.vim
  source ~/.config/nvim/plug-config/peekaboo.vim
  source ~/.config/nvim/plug-config/ultisnips.vim
  source ~/.config/nvim/plug-config/fzf-preview.vim
  source ~/.config/nvim/plug-config/jinja.vim
  source ~/.config/nvim/plug-config/fugitive.vim
  source ~/.config/nvim/plug-config/skylight.vim
  source ~/.config/nvim/plug-config/easy-align.vim
  source ~/.config/nvim/plug-config/indent-guides.vim
  source ~/.config/nvim/plug-config/quickscope.vim
  " lsp core
  luafile ~/.config/nvim/lua/plugin-configurations/init.lua
  luafile ~/.config/nvim/lua/lsp-configurations/init.lua
  luafile ~/.config/nvim/lua/lsp-language-configurations/init.lua
endif

" Add paths to node and python here
if !empty(glob('~/.config/nvim/paths.vim'))
  source ~/.config/nvim/paths.vim
endif
