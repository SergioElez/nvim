require('config/term-colors')

-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup       -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd       -- Create autocommand
local usercmd = vim.api.nvim_create_user_command   -- Create usercommand

-- General settings:
--------------------

-- use Open instead of netrw
usercmd(
  'Browse',
  "silent execute '!open' shellescape(<q-args>,1)",
  { nargs = 1, bang = true }
)

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- -- Don't auto comment new lines
-- autocmd('BufEnter', {
--   pattern = '',
--   command = 'set fo-=c fo-=r fo-=o'
-- })

-- Terminal settings:
---------------------

-- Open a Terminal on the right tab
-- autocmd('CmdlineEnter', {
--   command = 'command! Term :botright vsplit term://$SHELL'
-- })

-- Enter insert mode when switching to terminal
-- autocmd('TermOpen', {
--   command = 'setlocal listchars= nonumber norelativenumber nocursorline',
-- })
--
-- autocmd('TermOpen', {
--   pattern = '',
--   command = 'startinsert'
-- })

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

augroup('MisAutocomandos', { clear = true })
autocmd({"colorscheme"}, {
  pattern = {"*"},
  callback = rainbowColors,
  group = "MisAutocomandos"
})
autocmd({"colorscheme"}, {
  pattern = {"*"},
  callback = rainbowColors,
  group = "MisAutocomandos"
})

-- autocmd({"TermOpen"},{
  -- callback = term_colors,
  -- group = "MisAutocomandos"
-- })

-- function AutoFoldImports()
  -- local import_regex = [[/*import*/]]

  -- local fold_lines = {}

  -- for lnum = 1, vim.fn.line('$') do
    -- local line = vim.fn.getline(lnum)

    -- if vim.fn.match(line, import_regex) >= 0 then
      -- table.insert(fold_lines, lnum)
    -- end
  -- end
  -- vim.fn.setline('$', {})
  -- vim.fn.setline(1, fold_lines)
  -- vim.cmd("normal! zM")
  
-- end



-- vim.cmd([[
-- augroup MisAutocomandos
  -- autocmd!
  -- autocmd FileType java silent! 1,?import?fold
  -- autocmd FileType java silent! 1,?import?foldclose
-- augroup END
-- ]])

-- autocmd({"BufNew"},{
  -- callback = AutoFoldImports,
  -- group = "MisAutocomandos"
-- })





-- vim.g.NERDTreeGitStatusIndicatorMapCustom = {
  -- Modified  = "✹ ",
  -- Staged    = "✚ ",
  -- Untracked = "✭ ",
  -- Renamed   = "➜ ",
  -- Unmerged  = "═ ",
  -- Deleted   = "✖ ",
  -- Dirty     = "✗ ",
  -- Clean     = "✔︎ ",
  -- Ignored   = "☒ ",
  -- Unknown   = "? ",
-- }

-- vim.cmd([[
    -- autocmd FileType nerdtree syntax match HideBracketsInNerdTree "\]" conceal
    -- autocmd FileType nerdtree syntax match HideBracketsInNerdTree "\[" conceal
    -- autocmd FileType nerdtree setlocal conceallevel=1
    -- autocmd FileType nerdtree setlocal concealcursor=nvic
  -- ]])

-- Scroll de 15 en NvimTree
vim.cmd[[
  autocmd FileType * if &filetype == 'NvimTree' | set scrolloff=15 | else | set scrolloff=10 | endif
]]
