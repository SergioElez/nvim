vim.g.mapleader = ' '


-- Automatically install lazy.nvim if it does not exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function rainbowColors(event)
    vim.api.nvim_set_hl(0, "TSRainbowRed", {
      link = "Operator"
    })

    vim.api.nvim_set_hl(0, "TSRainbowCyan", {
      link = "Keyword"
    })

    vim.api.nvim_set_hl(0, "TSRainbowYellow", {
      link = "String"
    })

    vim.api.nvim_set_hl(0, "TSRainbowBlue", {
      link = "Float"
    })

    vim.api.nvim_set_hl(0, "TSRainbowGreen", {
      link = "Function"
    })

    vim.api.nvim_set_hl(0, "TSRainbowOrange", {
      link = "@parameter"
    })

    vim.api.nvim_set_hl(0, "TSRainbowViolet", {
      link = "c"
    })
  end


require('core')
require('lazy').setup('plugins')
require('lsp')
require('keymappings')
require('config/projects-config')
require('config/term-colors')

-- Neovide
if vim.g.neovide then
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animation_length = 0.05
    -- Para hacer Ctrl+Scroll
    require("size-matters")
  --  Para que el titulo no salga vacio 
    vim.cmd('set title autoread')
    
    -- vim.o.guifont="JetBrains Mono:h17"
    
end

-- rainbowColors()

-- Descargar https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono16.zip
vim.o.guifont="RobotoMono Nerd Font:h16"
vim.wo.foldcolumn="1"
vim.cmd([[hi! link PreProc Normal]])
-- vim.wo.cursorline = true
vim.cmd('set termguicolors')

-- Folds
vim.o.foldmethod="manual"
vim.o.foldlevelstart=1
vim.o.fillchars = [[foldopen:,foldsep: ,foldclose:]]
