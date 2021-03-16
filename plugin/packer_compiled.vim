" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  anyfold = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/anyfold"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/far.vim"
  },
  fzf = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-preview.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf-preview.vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_utils = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim_utils"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  rnvimr = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-node-modules.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope-node-modules.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope-vimspector.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope-vimspector.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-bbye"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-indent-guides"
  },
  ["vim-jinja"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-jinja"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-skylight"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-skylight"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vim-windowswap"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-windowswap"
  },
  vimspector = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vimspector"
  }
}

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
