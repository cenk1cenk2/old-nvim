local helpers = require('helper-functions')

helpers.autocommand.define_augroups({JinjaSetFileTypes = {{'BufNewFile,BufRead', '*.j2', 'set ft=jinja'}}})
