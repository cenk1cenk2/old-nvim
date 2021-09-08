require('neogen').setup({
  enabled = true,
  languages = {
    javascriptreact = {template = {annotation_convention = 'jsdoc'}},
    typescript = {template = {annotation_convention = 'jsdoc'}},
    typescriptreact = {template = {annotation_convention = 'jsdoc'}}
  }
})
