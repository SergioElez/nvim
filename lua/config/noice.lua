
require("noice").setup({
    routes = {
      {filter = { find = [[NvimTree_1]] }, opts = { skip = true }},
      {filter = { find = "escritos" }, opts = { skip = true }},
      {filter = { find = "--" }, opts = { skip = true }},
      {filter = { find = "lines" }, opts = { skip = true }},
      {filter = { find = "ServiceReady" }, opts = { skip = true }},
    },
    notify = {
      enabled = false,
      view = "notify",
    },
    lsp = {
      message = { enabled = false},
      progress = {
        enabled = false}
    },
    cmdline = {
      enabled = false
    },
    presets = {
      long_message_to_split = true
    },
    messages = {
      enabled = true, -- enables the Noice messages UI
      view = "notify", -- default view for messages
      -- view = "false", -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "notify", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
})

----------------------------------
-- LINEAS DE INDENTACION DE COLORES
  
-- local highlight = {
--   "RainbowRed",
--   "RainbowYellow",
--   "RainbowBlue",
--   "RainbowOrange",
--   "RainbowGreen",
--   "RainbowViolet",
--   "RainbowCyan",
-- }

-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)

-- require("ibl").setup { indent = { highlight = highlight } }