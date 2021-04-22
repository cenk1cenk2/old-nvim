require('trouble').setup({
  action_keys = { -- key mappings for actions in the trouble list
    close = 'q', -- close the list
    refresh = 'r', -- manually refresh
    jump = '<cr>', -- jump to the diagnostic or open / close folds
    toggle_mode = 'm', -- toggle between "workspace" and "document" mode
    toggle_preview = 'P', -- toggle auto_preview
    preview = 'p', -- preview the diagnostic location
    close_folds = 'zc', -- close all folds
    cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
    open_folds = 'zo', -- open all folds
    previous = 'k', -- preview item
    next = 'j' -- next item
  }
})
