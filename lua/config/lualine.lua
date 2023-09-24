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

  teal = "#3AC1A8",
  pastelpink = "#FF9AA2",
  navyblue = "#1B365D",
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
local function prueba()
  return 'a'
end

local function is_file_modified()
  local bufnr = vim.fn.bufnr('%') -- Obtener el número del búfer actual
  local buf_info = vim.fn.getbufinfo(bufnr)[1] -- Obtener información del búfer actual

  print(buf_info)
  -- Comprobar si el tiempo de modificación del archivo es mayor que el tiempo en que se abrió
  if buf_info and buf_info.modified == 1 then
      return "+"
  else
      return ""
  end
end


function get_git_commit_counts()

  -- local result = vim.fn.systemlist('git cherry -v')

  -- local cont_commits_to_push = 0;
  -- for _, line in ipairs(result) do
    -- cont_commits_to_push = cont_commits_to_push + 1;
  -- end

  if(total_commits ==  0) then
    return ""
  else
    return total_commits .. "󱦲"
  end

  -- local result = vim.fn.system('echo hola')
end

total_commits = 0

require('lualine').setup {
  options = {
    theme = molokai_bubble,
    -- component_separators = '',
    component_separators = '',
    section_separators = { left = '', right = '' },
    refresh = {
      statusline = 5000,
      tabline = 5000,
      winbar = 5000,
    }
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = ' ', right = '  ' }, right_padding = 2 },
    },
    lualine_b = {
      { is_file_modified},
      { 'filename', separator = { left = '', right = '' }, right_padding = 2,
      symbols = {
        modified = '󰷈',      -- Text to show when the buffer is modified
        readonly = '󱪟',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '󱪗', -- Text to show for unnamed buffers.
        newfile = '󱪝',     -- Text to show for newly created file before first write
        },
      },
      {'branch', icon = {'', color={fg=colors.magenta}}},
      {get_git_commit_counts},
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
      {'searchcount', icon = {'', color={fg=colors.purple}}},
      {'selectioncount', icon = {'󰈚', color={fg='#ffffff'}}}
    },
    lualine_y = {

      {'filetype'},
      { 'progress'},
    },
    lualine_z = {
      -- { 'location', separator = { left = ' ', right = ' ' }, left_padding = 2 },
      { 'location', separator = { left = '', right = ' ' }, left_padding = 0, right_padding = 0, icon = {'󰦪', color={fg='#ffffff'}} },
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
