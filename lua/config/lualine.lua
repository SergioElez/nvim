local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  
  
  bg_inactive = "#2f3336",
  bg = "#3E4347",
  fg = "#f8f8f2",
  fg_gutter = "#808080",
  comment = "#7e8e91",
  blue = "#ffffff",
  cyan = "#6694EF",
  magenta = "#f92672",
  purple = "#ae81ff",
  orange = "#fd971f",
  yellow = "#e6db74",
  green = "#8AC21B",
  springgreen = "#00ff87",
  red = "#ff4a44",
}

local molokai_bubble = {
  normal = {
    a = { fg = colors.black, bg = colors.cyan },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.bg, bg = colors.bg },
    x = { fg = colors.white, bg = colors.bg },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  command = { a = { fg = colors.black, bg = colors.magenta } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.bg_inactive },
    b = { fg = colors.white, bg = colors.bg_inactive },
    c = { fg = colors.black, bg = colors.bg_inactive },
  },
}
require('lualine').setup {
  options = {
    theme = molokai_bubble,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = ' ', right = '  ' }, right_padding = 2 },
    },
    lualine_b = { 
      { 'filename', separator = { left = '', right = '' }, right_padding = 2},
      {'branch'},
      { require("capslock").status_string, icon = {'󰪛', color={fg=colors.red}}},
    },
    lualine_c = {
      
      'fileformat',
      {
        'diagnostics',
        separator = { left = '', right = '' },
        symbols = {
          error = ' ',
        },
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = '#ffffff' } },
      },
      {
        'diagnostics',
        separator = { left = '', right = '' },
        symbols = {
          warn = ' ',
        },
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = '#ffffff' } },
      },
    },
    lualine_x = {
      -- { require("capslock").status_string },
      
    },
    lualine_y = {
      {'filetype'},
      { 'progress'},
    },
    lualine_z = {
      -- { 'location', separator = { left = ' ', right = ' ' }, left_padding = 2 },
      { 'location', separator = { left = '', right = ' ' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}