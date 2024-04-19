local wilder = require('wilder')

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    highlights = {
        gradient = gradient,
        border = 'DiagnosticSignInfo',
        default = 'NormalFloat'
    },
    highlighter = wilder.highlighter_with_gradient({
      wilder.basic_highlighter(),
        
    }),
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
    border = 'rounded',
    max_height = '75%',
    min_height = 0, 
    prompt_position = 'bottom',
    reverse = 0,
    pumblend = 20,
  })
))

wilder.setup({modes = {':', '/', '?'},
  accept_key = "<M-k>",
  next_key = '<Tab>',
	previous_key = '<S-Tab>',
})
wilder.set_option('use_python_remote_plugin', 0)
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      set_pcre2_pattern = 1,
    }),
    wilder.python_search_pipeline({
      pattern = 'fuzzy',
    }),
    wilder.search_pipeline()
  ),
})

-- Subir
vim.keymap.set('c', '<C-j>', 'wilder#in_context() ? wilder#next() : "\\<C-j>"', { expr = true })
-- Bajar
vim.keymap.set('c', '<C-k>', 'wilder#in_context() ? wilder#previous() : "\\<C-k>"', { expr = true })
--Subir historial
vim.keymap.set('c', '<M-j>', 'wilder#reject_completion() ? wilder#can_reject_completion() : "\\<C-p>"', { expr = true })
--Bajar historial
vim.keymap.set('c', '<M-k>', 'wilder#accept_completion() ? wilder#can_accept_completion() : "\\<C-n>"', { expr = true })
--Enter
vim.keymap.set('c', '<C-Space>', 'wilder#accept_completion() ? wilder#can_accept_completion() : "\\<C-m>"', { expr = true })

