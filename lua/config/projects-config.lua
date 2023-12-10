local utils = require('utils')
local remap = require("me.util").remap

-- Se resetea las opciones de catalina home al inicio de la sesion
vim.env["CATALINA_OPTS"] = ""

-- Tomcat DEBUG
utils:addEnvVariable("CATALINA_OPTS", "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8080")
utils:addEnvVariable("CATALINA_OPTS", "-Dretiro=C:\\Oracle\\Middleware\\Oracle_Home\\user_projects\\domains\\base_domain\\config\\properties")


run = {}

-- Configuración de comandos
run.config = {
    {name="Clean install", dir=[[{root}]], cmd="mvn clean install"},
}









local telescope = require('telescope')
local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')


function runConfigTelescope()
    pickers.new({
        layout_config = {
            width = 0.5,  -- Ajusta el ancho de la ventana para esta instancia
            height = 0.5, -- Ajusta la altura de la ventana para esta instancia
        },
    },
    {
        results_title = 'Run Configs',
        prompt_title = 'Run Command',
        finder = finders.new_table({
            results = run.config,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name .. ": " .. entry.cmd,
                    ordinal = entry.name .. ": " .. entry.cmd,
                }
            end,
        }),
        results_height = 5,
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(_, map)
            actions.select_default:replace(function(prompt_bufnr)
                local entry = require('telescope.actions.state').get_selected_entry()

                -- Verifica si la selección es un número (índice)
                if type(entry.index) == "number" then
                    entry.value = run.config[entry.index]
                end

                run.execute_selected_command(entry.value)
                actions.close(prompt_bufnr)
            end)
            return true
        end,
    }):find()
end

function run.execute_selected_command(entry)
    local root_directory = utils.find_project_root()

    -- Escapar los caracteres especiales en entry.dir antes de realizar la sustitución
    local escaped_dir = entry.dir:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1")

    -- Sustituir {root} con root_directory
    local dir = escaped_dir:gsub("{root}", root_directory)
 
    -- Convertir dir a string para asegurarse de que es tratado como tal
    dir = tostring(dir)

    local cmd = string.format([[:TermExec dir="%s" cmd="%s"]], dir, entry.cmd)
    vim.cmd(cmd)
end


remap("n", "<leader>r", "<cmd>lua runConfigTelescope()<cr>", bufopts, "Run config")

