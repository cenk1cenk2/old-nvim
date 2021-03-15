" auto-install vim-plug

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Repeat stuff
    Plug 'tpope/vim-repeat'

    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " Surround
    Plug 'tpope/vim-surround'

    " highlight yanks
    Plug 'machakann/vim-highlightedyank'

    " Text Navigation
    Plug 'unblevable/quick-scope'

  if exists('g:vscode')
    " highlight yank
    Plug 'ChristianChiarulli/vscode-easymotion'
  else
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'

    " Have the file system follow you around
    Plug 'airblade/vim-rooter'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'p00f/nvim-ts-rainbow'

    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'

    " Auto pairs for '(' '[' '{'
    Plug 'windwp/nvim-autopairs'

    " Closetags
    Plug 'alvan/vim-closetag'

    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Status Line
    Plug 'glepnir/galaxyline.nvim'

    " Ranger
    Plug 'kevinhwang91/rnvimr'

    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'main', 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/fzf.vim'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " Terminal
    Plug 'voldikss/vim-floaterm'

    " Start Screen
    Plug 'mhinz/vim-startify'

    " Better tabline
    Plug 'romgrk/barbar.nvim'

    " Find and replace
    Plug 'brooth/far.vim'

    " Smooth scroll
    Plug 'psliwka/vim-smoothie'

    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn & yarn add github-markdown-css'  }

    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " Intuitive buffer closing
    Plug 'moll/vim-bbye'

    " Debugging
    Plug 'puremourning/vimspector'

    " whitespace clean
    Plug 'ntpeters/vim-better-whitespace'

    " folding code
    Plug 'pseewald/anyfold'

    " maximize windows temporarary
    Plug 'szw/vim-maximizer'

    " show yank macro stuff on "
    Plug 'junegunn/vim-peekaboo'

    " async tasks
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " telescope extensions
    Plug 'nvim-telescope/telescope-github.nvim'
    Plug 'nvim-telescope/telescope-node-modules.nvim'
    Plug 'fhill2/telescope-ultisnips.nvim'
    Plug 'nvim-telescope/telescope-vimspector.nvim'
    Plug 'GustavoKatel/telescope-asynctasks.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'

    " Multiple Cursors
    Plug 'terryma/vim-multiple-cursors'

    " comments
    Plug 'preservim/nerdcommenter'

    " jinja
    Plug 'lepture/vim-jinja'

    " one dark
    Plug 'joshdick/onedark.vim'

    " snippet engines
    Plug 'SirVer/ultisnips'

    " snippets themselves
    Plug 'mattn/emmet-vim'
    Plug 'honza/vim-snippets'
    Plug 'hrsh7th/vim-vsnip'

    " skylight peak under the cursor for files
    Plug 'voldikss/vim-skylight'

    " easy align with keybinds
    Plug 'junegunn/vim-easy-align'

    " indent guidelines
    Plug 'nathanaelkane/vim-indent-guides'

    " move plugin
    Plug 'matze/vim-move'

    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " Swap windows
    Plug 'wesQ3/vim-windowswap'

    " undo time travel
    Plug 'mbbill/undotree'

    " lsp
    " Intellisense
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'onsails/lspkind-nvim'
    Plug 'kosayoda/nvim-lightbulb'

    " File Explorer
    Plug 'kyazdani42/nvim-tree.lua'

    " Better quickfix
    Plug 'kevinhwang91/nvim-bqf'
  endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
