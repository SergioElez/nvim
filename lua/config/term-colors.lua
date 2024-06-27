function term_colors()
    -- vim.cmd.syntax("clear")
    vim.cmd.syntax([[match Float /\d\+/]])
    vim.cmd.syntax([[match DiagnosticInfo /\v[A-Z]:.*>\>/]])
    -- vim.cmd.syntax([[match DiagnosticError /\v[!-/:\\]/]])
    vim.cmd.syntax("keyword DiagnosticError ERROR FAILURE")
    vim.cmd.syntax("keyword DiagnosticInfo INFO")
    vim.cmd.syntax("keyword DiagnosticWarn WARNING")
    vim.cmd.syntax("keyword DiagnosticOk OK SUCCESS")
end


-- EJEMPLO AUTCMD
-- Miniindentscope
-- vim.b.miniindentscope_disable = true

-- function disable_miniindentscope()
    -- local filetype = vim.bo.filetype -- Obtiene el tipo de archivo del buffer actual
    -- if filetype == "NvimTree" then
        -- vim.b.miniindentscope_disable = true -- Deshabilita miniindentscope para el tipo de archivo "startup"
    -- else
        -- vim.b.miniindentscope_disable = false -- Habilita miniindentscope para otros tipos de archivo
    -- end
--   end

--   vim.cmd([[
    -- augroup DisableMiniIndentScope
        -- autocmd!
        -- autocmd FileType * lua disable_miniindentscope()
    -- augroup END
--   ]])