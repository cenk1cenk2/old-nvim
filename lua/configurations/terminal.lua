-- automatically go in to insert mode when terminal is clicked
local helpers = require('helper-functions')

helpers.autocommand
  .define_augroups({terminal_setup = {{'TermOpen', '*', 'nnoremap <buffer><LeftRelease> <LeftRelease>i'}, {'TermOpen', '*', 'setlocal nonumber norelativenumber'}}})
