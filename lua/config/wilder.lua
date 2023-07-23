local wilder = require('wilder')

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    highlights = {
        gradient = gradient,
        border = 'FloatBorder',
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

wilder.setup({modes = {':', '/', '?'}})
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



