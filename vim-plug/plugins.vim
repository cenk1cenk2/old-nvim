" auto-install vim-plug

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Comments
    " Plug 'tpope/vim-commentary'
    " Change dates fast
    " Plug 'tpope/vim-speeddating'
    " Convert binary, hex, etc..
    " Plug 'glts/vim-radical'
    " Repeat stuff
    Plug 'tpope/vim-repeat'
    " Text Navigation
    " Useful for React Commenting
    Plug 'suy/vim-context-commentstring'
    " highlight all matches under cursor
    " Plug 'RRethy/vim-illuminate'

    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " Surround
    Plug 'tpope/vim-surround'

    " highlight yanks
    Plug 'machakann/vim-highlightedyank'

  if exists('g:vscode')
    " highlight yank
    Plug 'ChristianChiarulli/vscode-easymotion'
  else
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Have the file system follow you around
    Plug 'airblade/vim-rooter'
    " auto set indent settings
    Plug 'tpope/vim-sleuth'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
    " Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'glepnir/galaxyline.nvim'
    Plug 'kevinhwang91/rnvimr'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/fzf.vim'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Start Screen
    Plug 'mhinz/vim-startify'
    " Vista
    Plug 'liuchengxu/vista.vim'
    " Zen mode
    Plug 'junegunn/goyo.vim'
    " Interactive code
    Plug 'metakirby5/codi.vim'
    " Better tabline
    Plug 'romgrk/barbar.nvim'
    " undo time travel
    Plug 'mbbill/undotree'
    " Find and replace
    " Plug 'ChristianChiarulli/far.vim'
    Plug 'brooth/far.vim'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " live server
    Plug 'turbio/bracey.vim'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " " async tasks
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    " Swap windows
    Plug 'wesQ3/vim-windowswap'
    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn & yarn add github-markdown-css'  }
    " Easily Create Gists
    " Plug 'mattn/vim-gist'
    Plug 'mattn/webapi-vim'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Intuitive buffer closing
    Plug 'moll/vim-bbye'
    " Debugging
    Plug 'puremourning/vimspector'

    " ansible related
    " Plug 'arouene/vim-ansible-vault'
    " Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
    " whitespace clean
    Plug 'ntpeters/vim-better-whitespace'
    " npm package versions, not working reliable
    Plug 'meain/vim-package-info', { 'do': 'npm install' }
    " folding code
    Plug 'pseewald/anyfold'
    " maximize windows temporarary
    Plug 'szw/vim-maximizer'
    " show yank macro stuff on "
    Plug 'junegunn/vim-peekaboo'
    " shell format
    Plug 'z0mbix/vim-shfmt', { 'for': 'sh', 'do': 'GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt' }
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Multiple Cursors
    Plug 'terryma/vim-multiple-cursors'
    " Rainbow parenthesis
    Plug 'luochen1990/rainbow'
    " comments
    Plug 'preservim/nerdcommenter'
    " jinja
    Plug 'lepture/vim-jinja'

    " one dark
    Plug 'joshdick/onedark.vim'

    " snippet engines
    Plug 'SirVer/ultisnips'
    " Plug 'MarcWeber/vim-addon-mw-utils'
    " Plug 'tomtom/tlib_vim'
    " Plug 'garbas/vim-snipmate'

    " snippets themselves
    Plug 'mattn/emmet-vim'
    Plug 'honza/vim-snippets'

    " go lang
    Plug 'fatih/vim-go', { 'do': 'GO111MODULE=on go get golang.org/x/tools/gopls@latest' }

    " bookmarks
    Plug 'MattesGroeger/vim-bookmarks'

    " conflict motions for git conflicts
    " Plug 'vim-scripts/ConflictMotions'
    " Plug 'inkarkat/vim-CountJump'
    " Plug 'inkarkat/vim-ingo-library'

    " vim-mergetool
    Plug 'samoshkin/vim-mergetool'

    " tailwinds
    Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

    " skylight peak under the cursor for files
    Plug 'voldikss/vim-skylight'

    " easy align with keybinds
    Plug 'junegunn/vim-easy-align'

    " indent guidelines
    Plug 'nathanaelkane/vim-indent-guides'

    " for graphql coc
    Plug 'jparise/vim-graphql'

    " move plugin
    Plug 'matze/vim-move'
  endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
