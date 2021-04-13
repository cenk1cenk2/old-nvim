-- automatically go in to insert mode when terminal is clicked
local helpers = require('helper-functions')

helpers.autocommand.define_augroups({
  DisableContuniationOfComments = {
    {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
    {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
    {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'}
  }
})
