local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute('packadd packer.nvim')
end

vim.cmd([[packadd packer.nvim]])

-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Quality of life improvements
  use {'norcalli/nvim_utils'}

  -- easy motion, hop now
  use {'phaazon/hop.nvim'}

  -- Repeat last commands
  use {'tpope/vim-repeat'}

  -- surround, change surround
  use {'tpope/vim-surround'}

  -- highlight yanks
  use {'machakann/vim-highlightedyank'}

  -- quick scope, t-f navigation
  use {'unblevable/quick-scope'}

  if vim.g.vscode then
    -- vscode easy motion
    use {'ChristianChiarulli/vscode-easymotion'}
  else
    -- theme
    use {'joshdick/onedark.vim'}

    -- icons
    use {'kyazdani42/nvim-web-devicons'}
    use {'ryanoasis/vim-devicons'}

    -- start screen
    use {'mhinz/vim-startify'}

    -- which key
    use {'liuchengxu/vim-which-key'}

    -- status line
    use {'glepnir/galaxyline.nvim'}

    -- tab line
    use {'romgrk/barbar.nvim'}

    -- smooth scroll
    use {'psliwka/vim-smoothie'}

    -- find and replace
    use {'brooth/far.vim'}

    -- multiple cursors
    use {'terryma/vim-multiple-cursors'}

    -- comments
    use {'preservim/nerdcommenter'}

    -- ranger
    use {'kevinhwang91/rnvimr'}

    -- buffer close
    use {'moll/vim-bbye'}

    -- maximize windows temporararily
    use {'szw/vim-maximizer'}

    -- move windows with keybinds
    use {'wesQ3/vim-windowswap'}

    -- whitespace control
    use {'ntpeters/vim-better-whitespace'}

    -- code folding
    use {'pseewald/anyfold'}

    -- undo-tree
    use {'mbbill/undotree'}

    -- better quick fix window
    -- use {'kevinhwang91/nvim-bqf'} -- (temp)

    -- peek registers and macros
    use {'gennaro-tedesco/nvim-peekup'}

    -- file explorer
    use {'kyazdani42/nvim-tree.lua'}

    -- terminal
    use {'voldikss/vim-floaterm'}

    -- lsp
    use {'neovim/nvim-lspconfig'}

    -- lsp completion
    use {'hrsh7th/nvim-compe'}

    -- lsp extensions
    use {'glepnir/lspsaga.nvim'}
    use {'onsails/lspkind-nvim'}
    use {'kosayoda/nvim-lightbulb'}

    -- illumunate
    use {'RRethy/vim-illuminate'}

    -- snippets
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'rafamadriz/friendly-snippets'}
    use {'kitagry/vs-snippets'}

    -- legacy
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}

    -- debug adapter
    use {'puremourning/vimspector'}

    -- syntax highlighting for the rest
    use {'sheerun/vim-polyglot'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'p00f/nvim-ts-rainbow', run = ':TSUpdate'}
    use {'windwp/nvim-ts-autotag'}

    -- Colorized
    use {'norcalli/nvim-colorizer.lua'}

    -- telescope
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}

    -- telescope extensions
    use {'nvim-telescope/telescope-node-modules.nvim'}
    use {'fhill2/telescope-ultisnips.nvim'}
    use {'nvim-telescope/telescope-vimspector.nvim'}
    use {'GustavoKatel/telescope-asynctasks.nvim'}
    use {'nvim-telescope/telescope-media-files.nvim'}
    use {'TC72/telescope-tele-tabby.nvim'}
    use {'nvim-telescope/telescope-github.nvim'}
    use {'gbrlsnchs/telescope-lsp-handlers.nvim'}

    -- git related
    -- use {'airblade/vim-gitgutter'}
    use {'lewis6991/gitsigns.nvim'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    use {'junegunn/gv.vim'}

    -- coc for now
    use {'neoclide/coc.nvim', branch = 'release'}

    -- fzf
    use {
      'junegunn/fzf',
      run = function()
        vim.fn['fzf#install']()
      end
    }
    use {'yuki-ycino/fzf-preview.vim', branch = 'main', run = ':UpdateRemotePlugins'}
    use {'junegunn/fzf.vim'}

    -- chdir, to working directory
    use {'airblade/vim-rooter'}

    -- autopairing parenthesis
    use {'windwp/nvim-autopairs'}

    -- move stuff around with altjk
    use {'matze/vim-move'}

    -- align around some anchor
    use {'junegunn/vim-easy-align'}

    -- indent guidelines
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- tasks
    use {'skywind3000/asynctasks.vim'}
    use {'skywind3000/asyncrun.vim'}

    -- markdown previewer
    use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn & yarn add -D tslib', ft = {'markdown'}}

    -- jinja syntax highlights
    use {'lepture/vim-jinja'} -- (temp)

    -- bookmarks
    use {'MattesGroeger/vim-bookmarks'}

  end

end)
