local remap = require("me.util").remap

local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
    remap('n', 'gD', vim.lsp.buf.declaration, bufopts, "Ir a la declaración")
    remap('n', 'gd', vim.lsp.buf.definition, bufopts, "Ir a la declaración")
    remap('n', 'gi', vim.lsp.buf.implementation, bufopts, "Ir a la implementación")
    remap('n', 'K', vim.lsp.buf.hover, bufopts, "Hover texto")
    remap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts, "Mostrar signature")
    remap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Agregar carpeta al workspace")
    remap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Quitar carpeta del workspace")
    remap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, "Lista de carpetas del workspace")
  remap('n', '<space>D', vim.lsp.buf.type_definition, bufopts, "Ir a la declaración del tipo")
  remap('n', '<space>rn', vim.lsp.buf.rename, bufopts, "Renombrar")
  remap('n', '<space>a', vim.lsp.buf.code_action, bufopts, "Acciones de codigo")
  vim.keymap.set('v', "<space>a", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap=true, silent=true, buffer=bufnr, desc = "Acciones de codigo" })
  remap('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts, "Formatear archivo")
end

return M
