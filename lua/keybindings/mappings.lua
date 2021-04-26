-- set leader
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', [[<Space>]], [[<Nop>]], {})

-- disable help
vim.api.nvim_set_keymap('i', [[<F1>]], [[<Nop>]], {silent = true})

-- window moving keybinds
vim.api.nvim_set_keymap('i', [[<C-h>]], [[<C-w>h]], {})
vim.api.nvim_set_keymap('i', [[<C-j>]], [[<C-w>j]], {})
vim.api.nvim_set_keymap('i', [[<C-k>]], [[<C-w>k]], {})
vim.api.nvim_set_keymap('i', [[<C-l>]], [[<C-w>l]], {})

-- easier block indenting
vim.api.nvim_set_keymap('v', [[<]], [[<gv]], {})
vim.api.nvim_set_keymap('v', [[>]], [[>gv]], {})

-- create space on top and bottom
vim.api.nvim_set_keymap('n', [[Ü]], [[o<ESC>k]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[ü]], [[O<ESC>j]], {silent = true, noremap = true})

-- jump between paragraphs
vim.api.nvim_set_keymap('n', [[ö]], [[{zz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[ä]], [[}zz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[ö]], [[{]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[ä]], [[}]], {silent = true, noremap = true})

-- jump between methods
vim.api.nvim_set_keymap('n', [[äö]], [[[mzz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[öä]], [[]mzz]], {silent = true, noremap = true})

-- jump between curly braces
vim.api.nvim_set_keymap('n', [[Ö]], [[?{<CR>:let @/ = ""<CR>zz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[Ä]], [[/{<CR>:let @/ = ""<CR>zz]], {silent = true, noremap = true})

-- run through function parantheses
vim.api.nvim_set_keymap('n', [[#]], [[/(<CR>:let @/ = ""<CR>zz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[*]], [[?)<CR>:let @/ = ""<CR>zz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[+]], [[?(<CR>:let @/ = ""<CR>zz]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', [[']], [[/)<CR>:let @/ = ""<CR>zz]], {silent = true, noremap = true})

-- copy last clipboard register
vim.api.nvim_set_keymap('n', [[po]], [["_diw"*P]], {silent = true, noremap = true})

-- copy last yank register
vim.api.nvim_set_keymap('n', [[pü]], [["_diw"0P]], {silent = true, noremap = true})

-- visual select word
vim.api.nvim_set_keymap('n', [[pp]], [[viw]], {silent = true, noremap = true})

-- c to blackhole
vim.api.nvim_set_keymap('n', [[c]], [["_c]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[c]], [["_c]], {silent = true, noremap = true})

-- x to blackhole
vim.api.nvim_set_keymap('n', [[x]], [["_x]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[x]], [["_x]], {silent = true, noremap = true})

-- dont overwrite in visual mode while pasting
vim.api.nvim_set_keymap('x', [[p]], [["_dP]], {silent = true, noremap = true})

-- Disable Ex mode
vim.api.nvim_set_keymap('n', [[Q]], [[<Nop>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', [[Q]], [[<Nop>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('x', [[Q]], [[<Nop>]], {silent = true, noremap = true})

-- switch between current and last buffer
vim.api.nvim_set_keymap('n', [[g.]], [[<C-^>]], {silent = true, noremap = true})

-- copy line to paste in visual mode with out new line
vim.api.nvim_set_keymap('n', [[yl]], [[vg_y]], {silent = true, noremap = true})

if (vim.g.vscode) then

else
  -- remap escape
  vim.api.nvim_set_keymap('i', [[jk]], [[<Esc>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[kj]], [[<Esc>]], {silent = true, noremap = true})

  -- buffer movement
  vim.api.nvim_set_keymap('n', [[<Leader><Left>]], [[:BufferPrevious<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<Leader><Right>]], [[:BufferNext<CR>]], {silent = true, noremap = true})

  -- move buffers
  vim.api.nvim_set_keymap('n', [[<C-Up>]], [[:BufferMovePrevious<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<C-Down>]], [[:BufferMoveNext<CR>]], {silent = true, noremap = true})

  -- alternate way to save
  vim.api.nvim_set_keymap('n', [[<C-s>]], [[:w<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<C-x>]], [[:noa w<CR>:echo "No autocommands had been run while saving!!!"<CR>]], {silent = true, noremap = true})

  -- close quick fix
  vim.api.nvim_set_keymap('n', [[<C-e>]], [[:cclose<CR>]], {silent = true, noremap = true})

  -- alternate way to quit
  vim.api.nvim_set_keymap('n', [[<C-q>]], [[:BufferClose<CR>]], {silent = true, noremap = true})

  -- split to tab
  vim.api.nvim_set_keymap('n', [[<C-t>]], [[<C-w>T]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<C-E>]], [[<C-w><C-o>]], {silent = true, noremap = true})

  -- use control c instead of escape
  -- vim.api.nvim_set_keymap('n', [[<C-c>]], [[<Esc>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<C-c>]], [[<Esc>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('v', [[<C-c>]], [[<Esc>]], {silent = true, noremap = true})

  -- better window navigation
  vim.api.nvim_set_keymap('n', [[<C-h>]], [[<C-w>h]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<C-j>]], [[<C-w>j]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<C-k>]], [[<C-w>k]], {silent = true, noremap = true})

  vim.api.nvim_set_keymap('n', [[<C-l>]], [[<C-w>l]], {silent = true, noremap = true})

  -- terminal window navigation
  vim.api.nvim_set_keymap('t', [[<C-h>]], [[<C-\><C-N><C-w>h]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('t', [[<C-j>]], [[<C-\><C-N><C-w>j]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('t', [[<C-k>]], [[<C-\><C-N><C-w>k]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('t', [[<C-l>]], [[<C-\><C-N><C-w>l]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<C-h>]], [[<C-\><C-N><C-w>h]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<C-j>]], [[<C-\><C-N><C-w>j]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<C-k>]], [[<C-\><C-N><C-w>k]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<C-l>]], [[<C-\><C-N><C-w>l]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('t', [[<Esc>]], [[<C-\><C-n>]], {silent = true, noremap = true})

  -- resize window
  vim.api.nvim_set_keymap('n', [[<M-u>]], [[:resize -2<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<M-i>]], [[:resize +2<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<M-z>]], [[:vertical resize -2<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('n', [[<M-o>]], [[:vertical resize +2<CR>]], {silent = true, noremap = true})

  vim.api.nvim_set_keymap('v', [[<M-u>]], [[:resize -2<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('v', [[<M-i>]], [[:resize +2<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('v', [[<M-z>]], [[:vertical resize -2<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('v', [[<M-o>]], [[:vertical resize +2<CR>]], {silent = true, noremap = true})

  -- tmux fixes
  vim.api.nvim_set_keymap('i', [[<C-a>]], [[<Home>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<C-e>]], [[<End>]], {silent = true, noremap = true})

  -- ranger quick open
  vim.api.nvim_set_keymap('n', [[<F5>]], [[:RnvimrToggle<CR>]], {silent = true, noremap = true})
  vim.api.nvim_set_keymap('i', [[<F5>]], [[:RnvimrToggle<CR>]], {silent = true, noremap = true})
end
