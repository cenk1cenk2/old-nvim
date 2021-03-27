-- automatically go in to insert mode when terminal is clicked
local helpers = require('helper-functions')

helpers.autocommand.define_augroups({FileTypeYamlJinja = {{'BufRead,BufNewFile', '*.yml.j2', 'set ft=yaml'}}})
