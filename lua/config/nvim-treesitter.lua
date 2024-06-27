require'nvim-treesitter.configs'.setup {
  highlight = {
  -- Desabilitado en lua porque da error
    disable = { 'lua' },
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
  indent = {
    enable = true, -- Habilita el ajuste de indentación mediante Treesitter
  },
  folding = {
    enable = true, -- Habilita el plegado mediante Treesitter
    disable = { 'java' }, -- Deshabilita el plegado predeterminado para Java (lo manejaremos manualmente)
  },
  -- rainbow = {
    -- enable = true,
    -- disable = { 'jsx', 'cpp' },
    -- query = 'rainbow-parens',
    -- strategy = require('ts-rainbow').strategy.global,
    -- hlgroups = {
      -- 'TSRainbowRed',
      -- 'TSRainbowYellow',
      -- 'TSRainbowBlue',
      -- 'TSRainbowOrange',
      -- 'TSRainbowGreen',
      -- 'TSRainbowViolet',
      -- 'TSRainbowCyan'
  --  },
  -- }
  
  
}
-- Define la función de plegado para Java
function FoldJavaImports()
  -- Verifica que el archivo tenga extensión ".java"
  local filename = vim.fn.expand('%:t')
  if vim.fn.match(filename, "%.java$") == -1 then
    return
  end

  -- Ejecuta el comando :Fold de vim-fugitive para plegar las líneas de import
  vim.cmd('Fold')
end

-- Configura el plegado automático para Java después de cargar el buffer
vim.cmd([[
  augroup AutoFoldJavaImports
    autocmd!
    autocmd FileType java autocmd BufEnter <buffer> lua FoldJavaImports()
  augroup END
]])