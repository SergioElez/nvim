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
      link = "Float"
    })
  end


require('core')
require('lazy').setup('plugins')
require('lsp')
require('keymappings')


-- Neovide
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animation_length = 0.05
end


-- vim.cmd.colorscheme 'molokai'
-- require ("ts-rainbow").setup()



rainbowColors()


vim.o.guifont="Consolas:h17"
