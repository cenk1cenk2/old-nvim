"    ____      _ __        _
  " /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" load first for errors
if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif

" General Settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
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
  " source $HOME/.config/nvim/themes/onedark-buddy.vim

  " Plugin Configuration
  source $HOME/.config/nvim/keys/which-key.vim
  " source $HOME/.config/nvim/plug-config/vim-commentary.vim
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
endif

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif


" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
