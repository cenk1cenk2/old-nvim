vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.

vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = 'utf-8' -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = 'a' -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = '256' -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.tabstop = 2 -- Insert 2 spaces for a tab
vim.o.shiftwidth = 2 -- Change the number of space characters inserted for indentation
vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = 'unnamedplus' -- Copy paste between vim and everything else
vim.o.guifont = 'Consolas NF'
vim.o.incsearch = true
vim.o.lazyredraw = true
-- vim.cmd('set lazydraw')
vim.wo.wrap = false -- Display long lines as just one line
-- vim.cmd('set wrap linebreak nolist')
vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize'
