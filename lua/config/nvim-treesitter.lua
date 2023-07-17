require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,
  },
  -- rainbow = {
    -- enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { 'jsx', 'cpp' },
    -- Which query to use for finding delimiters
    -- query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    -- strategy = require('ts-rainbow').strategy.global,
  -- }
}
