local wilder = require('wilder')

local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

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
    {
      wilder.check(function(_, x) return x == '' end),
      wilder.history(50),
    },
    wilder.cmdline_pipeline(
    {
      -- wilder.history(5, ":"),
      -- wilder.check({ctx, x -> empty(x)}),
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

