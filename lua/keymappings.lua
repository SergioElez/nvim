-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local remap = require("me.util").remap
local bufopts = { silent = true, noremap = true }
local Logger = require'utils':new("Sergio")
local os = require("os")
local io = require("io")
local utils = require('utils')

-- Salir del modo insertar
remap("i", "jk", "<ESC>", {noremap = true})

-- Cambiar : por ;
remap("", ";", ":", {noremap = true})
remap("", ":", ";", {noremap = true})


-- Guardar archivo
-- remap("n", "<C-s>", "vapJgqap<cmd>update<cr>")
remap("n", "<C-s>", "<cmd>update<cr>")
remap("i", "<C-s>", "<cmd>update<cr>")

-- disable search highlighting by pressing enter
remap("n", "<cr>", "<cmd>:nohlsearch<cr><cr>")

-- tab management
remap("n", "<C-Insert>", "<cmd>:tabnew<cr>", bufopts, "New tab")
remap("n", "<C-Delete>", "<cmd>:tabclose<cr>", bufopts, "Close tab")
remap("i", "<C-Insert>", "<cmd>:tabnew<cr>", bufopts, "New tab")
remap("i", "<C-Delete>", "<cmd>:tabclose<cr>", bufopts, "Close tab")

remap("n", "th", "<cmd>:tabfirst<cr>", bufopts, "First tab")
remap("n", "tk", "<cmd>:tabnext<cr>", bufopts, "Next tab")
remap("n", "tj", "<cmd>:tabprev<cr>", bufopts, "Previous tab")
remap("n", "tl", "<cmd>:tablast<cr>", bufopts, "Last tab")
remap("n", "tt", "<cmd>:tabedit<cr>", bufopts, "New tab")
remap("n", "td", "<cmd>:tabclose<cr>", bufopts, "Close tab")
remap("n", "tn", "<cmd>:tabmove -1<cr>", bufopts, "Move tab next")
remap("n", "tm", "<cmd>:tabmove +1<cr>", bufopts, "Move tab previous")

-- window management
remap("n", "<C-Right>", "<cmd>:vertical resize -1<cr>", bufopts, "Minimizar ventana")
remap("n", "<C-Left>", "<cmd>:vertical resize +1<cr>", bufopts, "Maximizar ventana")

require("which-key").register({
  Q = {
    name = "Formatear párrafo",
  },
}, { prefix = "<leader>" })

-- formatting
remap("n", "Q", "gqap", bufopts, "Formatear párrafo")
remap("x", "Q", "gq", bufopts, "Formatear párrafo")
remap("n", "<leader>Q", "vapJgqap", bufopts, "Mergear párrafos")

--
-- Plugins
--

-- vim-marked
remap("n", "<leader>qm", "<cmd>MarkedOpen<cr>", bufopts, "Abrir marked")

require("which-key").register({
  q = {
    name = "Vim pencil",
  },
}, { prefix = "<leader>" })

-- vim-pencil
remap("n", "<leader>qc", "<Plug>ReplaceWithCurly", bufopts, "Curl quotes")
remap("n", "<leader>qs", "<Plug>ReplaceWithStraight", bufopts, "Straighten quotes")

-- telescope
remap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", bufopts, "Buscar archivo")
remap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", bufopts, "Grep")
remap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", bufopts, "Buscar buffers")
remap("n", "<leader>fm", "<cmd>Telescope marks<cr>", bufopts, "Buscar marks")
remap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", bufopts, "Buscar referencias (LSP)")
remap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", bufopts, "Buscar símbolos (LSP)")
remap("n", "<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", bufopts, "Buscar llamadas entrantes(LSP)")
remap("n", "<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", bufopts, "Buscar llamadas salientes (LSP)")
remap("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", bufopts, "Buscar implementaciones (LSP)")
remap("n", "<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", bufopts, "Buscar errores (LSP)")
require("which-key").register({
  f = {
    name = "Buscar",
  },
}, { prefix = "<leader>" })

-- trouble
remap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", bufopts, "Mostrar errores")
remap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", bufopts, "Mostrar errores del workspace ")
remap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", bufopts, "Mostrar errores del documento")
require("which-key").register({
  x = {
    name = "Errores",
  },
}, { prefix = "<leader>" })



-- symbols-outline
remap("n", "<leader>o", "<cmd>SymbolsOutline<cr>", bufopts, "Símbolos")


function get_current_directory()
  -- Obtiene la ruta relativa del directorio del archivo abierto
  local relative_directory = vim.fn.expand('%:p:h')

  -- Obtiene la ruta absoluta del directorio del archivo abierto
  local absolute_directory = vim.fn.fnamemodify(relative_directory, ':p')
  
  return absolute_directory
end

-- Nvim tree
remap("n", "<leader><leader>", "<cmd>lua require('nvim-tree.api').tree.open({ path = get_current_directory() })<cr>", bufopts, "Explorador de archivos")
-- remap("n", "<leader><leader>", "<cmd>lua require('nvim-tree.api').tree.open()<cr>", bufopts, "Explorador de archivos")
remap("n", "<F3>", "<cmd>lua require'oil'.open_float()<cr>", bufopts, "Explorador de archivos")

-- vim-test
remap("n", "<leader>vt", "<cmd>TestNearest<cr>", bufopts, "Test más cercano")
remap("n", "<leader>vf", "<cmd>TestFile<cr>", bufopts, "Testear archivo")
remap("n", "<leader>vs", "<cmd>TestSuite<cr>", bufopts, "Testear suite")
remap("n", "<leader>vl", "<cmd>TestLast<cr>", bufopts, "Testear último test")
remap("n", "<leader>vg", "<cmd>TestVisit<cr>", bufopts, "Ir al test")
require("which-key").register({
  v = {
    name = "Testing",
  },
}, { prefix = "<leader>" })


remap("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", bufopts, "Poner breakpoint")
remap("n", "<leader>bb", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", bufopts, "Poner breakpoint")

remap("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", bufopts, "Poner breakpoint condicional")
remap("n", "<leader>bc", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", bufopts, "Poner breakpoint condicional")

remap("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", bufopts, "Borrar breakpoints")
remap("n", "<leader>br", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", bufopts, "Borrar breakpoints")

remap("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", bufopts, "Poner punto de log")
remap("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", bufopts, "Lista de breakpoints")


local skip_breakpoints = false
local breakpoint_lines = {}
function toggle_skip_breakpoints()
  if skip_breakpoints then
      -- Restaurar los breakpoints
      local bufnr = vim.api.nvim_get_current_buf()
      for _, line in ipairs(breakpoint_lines[bufnr] or {}) do
          vim.fn.sign_place(0, "breakpoint", "Breakpoint", bufnr, { lnum = line, priority = 10 })
      end
      breakpoint_lines[bufnr] = nil
  else
      -- Guardar y borrar los breakpoints actuales
      local bufnr = vim.api.nvim_get_current_buf()
      local signs = vim.fn.sign_getplaced(bufnr, {group = "breakpoint"})
      breakpoint_lines[bufnr] = {}
      for _, sign in ipairs(signs) do
          local line = sign.lnum
          table.insert(breakpoint_lines[bufnr], line)
          vim.fn.sign_unplace("breakpoint", { buffer = bufnr, id = line })
      end
      Logger:info(breakpoint_lines)
  end
  skip_breakpoints = not skip_breakpoints

  Logger:info(skip_breakpoints)
end

-- function skip()
  -- for _ = 1, 10 do
    -- require'dap'.continue()
  -- end
-- end

-- function skip()
  -- if not require("dap").session() then
    -- Logger:info("No se ha adjuntado un proceso de depuración.")
      -- return
  -- end

  -- local breakpoints = vim.fn.getbreakpoint()
  -- if not breakpoints or #breakpoints == 0 then
    -- Logger:info("No hay breakpoints activos.")
      -- return
  -- end

  -- for _, breakpoint in ipairs(breakpoints) do
      -- require("dap").continue(breakpoint.number)
  -- end

  -- Logger:info("Se han continuado todos los breakpoints.")
-- end

-- continued_breakpoints = {}
-- function skip()

  -- Comprobar si el proceso de depuración está adjunto
  -- if not require("dap").session() then
      -- Logger:info("No se ha adjuntado un proceso de depuración.")
      -- return
  -- end

  -- Obtener los breakpoints activos
  -- local breakpoints = require("dap").list_breakpoints()
  -- local breakpoints = require("telescope").extensions.dap.list_breakpoints()


  -- local breakpoints = require("dap.breakpoints").get()
  -- if not breakpoints or #breakpoints == 0 then
      -- Logger:info("No hay breakpoints activos.")
      -- return
  -- end
  -- Logger:info(vim.inspect(breakpoints))

  -- for _, breakpoint in ipairs(breakpoints) do
    -- local breakpoint_id = breakpoint.id
    -- if not continued_breakpoints[breakpoint_id] then
        -- require("dap").set_breakpoint(breakpoint_id, false)

        -- require("dap").continue(breakpoint_id)

        -- continued_breakpoints[breakpoint_id] = true
    -- end
  -- Logger:info("Se han continuado todos los breakpoints.")
-- end

function skip()
  for _ = 1, 10 do
    vim.cmd("normal! <leader>dc")
  end
end

remap("n", "<leader>bs", "<cmd>lua skip()<cr>", bufopts, "Skip breakpoints")


-- Signs para ver todos sign list
vim.fn.sign_define('DapBreakpoint', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '', texthl = 'DiagnosticSignInfo', linehl = 'NvimTreeOpenedFile'})
vim.fn.sign_define('DapBreakpointRejected', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})
-- vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointCondition', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
-- vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignInfo', {text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = ''})
vim.fn.sign_define('todo-sign-TODO', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})


require("which-key").register({
  u = {
    name = "DAP UI",
  },
}, { prefix = "<leader>d" })

remap('n', '<leader>dui', ':lua require("dapui").toggle()<CR>', bufopts, 'Alternar DAP UI')
remap('n', '<leader>dus', ':lua require("dapui").toggle("sidebar")<CR>', bufopts, 'Alternar barra lateral')
remap('n', '<leader>dut', ':lua require("dapui").toggle("tray")<CR>', bufopts, 'Alternar tray')

-- DAP Widgets
remap('n', '<leader>dwu', require('dap.ui.widgets').hover, bufopts, 'Mostrar expresión bajo el cursor')
remap('n', '<leader>dws',
    ':lua local widgets=require("dap.ui.widgets");widgets.sidebar(widgets.scopes).open()<CR>', bufopts,
    'Mostrar scopes')
remap('n', '<leader>dwf',
    ':lua local widgets=require("dap.ui.widgets");widgets.sidebar(widgets.frames).open()<CR>', bufopts,
    'Mostrar frames')

require("which-key").register({
  b = {
    name = "Breakpoints",
  },
}, { prefix = "<leader>" })

remap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", bufopts, "Continuar")
remap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", bufopts, "Siguiente paso")

remap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", bufopts, "Continuar")
remap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", bufopts, "Siguiente paso")
remap("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", bufopts, "Siguiente paso entrando dentro")
remap("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", bufopts, "Paso atrás")
remap("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", bufopts, "Desconectar")
remap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", bufopts, "Terminar")
remap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", bufopts, "Abrir REPL")
remap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", bufopts, "Ejecutar último adaptador")
remap("n", "<leader>di", function() require"dap.ui.widgets".hover() end, bufopts, "Variables")
remap("n", "<leader>d?", function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, bufopts, "Scopes")
remap("n", "<leader>df", "<cmd>Telescope dap frames<cr>", bufopts, "Lista de frames")
remap("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", bufopts, "Lista de comandos")


require("which-key").register({
  d = {
    name = "Debug",
  },
}, { prefix = "<leader>" })

require("which-key").register({
  w = {
    name = "Tomcat",
  },
}, { prefix = "<leader>d" })


local winid = nil

function WaitForListening(port, max_attempts, attempts)
    local result = vim.fn.systemlist('netstat -ano | findstr :' .. port)
    local listening_pos = nil

    for _, line in ipairs(result) do
        listening_pos = line:find("LISTENING")
        if listening_pos then
            print("Puerto está 'Listening'.")  -- Log si el puerto está "Listening"
            vim.cmd('ToggleTerm')
            vim.cmd('startinsert | stopinsert')
            require('dap').continue()
            return
        end
    end

    attempts = attempts + 1
    if attempts < max_attempts then
        print("Esperando, intento número: " .. attempts)  -- Log para mostrar los intentos
        vim.defer_fn(function()
            WaitForListening(port, max_attempts, attempts)
        end, 1000)
    else
        print("El puerto: " .. port .. " no está disponible después de esperar.")  -- Log si los intentos fallan
    end
end

function deploy_tomcat()
    local port = "8080"
    local result = vim.fn.systemlist('netstat -ano | findstr :' .. port)
    local ocuped = #result > 0

    local listening_pos = nil

    for _, line in ipairs(result) do
        listening_pos = line:find("LISTENING")
    end
    print(listening_pos)  -- Log para mostrar el resultado de listening_pos

    if ocuped and listening_pos then
        print("false")  -- Log si el puerto está ocupado
        print("El puerto: " .. port .. " esta ocupado, relanza el despliegue")
    else
        print("true")  -- Log si el puerto no está ocupado
        vim.cmd("silent! WildcatUp")
        term_colors()
        winid = vim.api.nvim_get_current_win()

        -- Esperar hasta que esté "Listening"
        local max_attempts = 5  -- Intentos reducidos para facilitar la depuración
        local attempts = 0
        WaitForListening(port, max_attempts, attempts)
    end
end

remap("n", "<F4>", "<cmd>lua deploy_tomcat()<cr>", bufopts, "Desplegar tomcat")
remap("n", "<leader>dww", "<cmd>lua deploy_tomcat()<cr>", bufopts, "Desplegar tomcat")
remap("n", "<leader>dwd", "<cmd>WildcatDown<cr>", bufopts, "Parar tomcat")

-- DESPLIEGUE DE WAR A TOMCAT
remap("n", "<leader>dwr", "<cmd>lua deploy_to_tomcat()<cr>", bufopts, "Desplegar war a tomcat")

function deploy_to_tomcat()
  -- Find the root directory of the project using the utility function from 'utils.lua'
  local root_directory = utils.find_project_root()

  if root_directory then
    -- Log the root directory found.
    vim.api.nvim_err_writeln("Root directory = " .. root_directory)

    -- Change the current working directory to the root directory of the project.
    vim.fn.execute("cd " .. root_directory)

    Logger:info("Haciendo mvn clean install en: " .. root_directory)

    -- Run the mvn command to clean install the project.
    -- os.execute("mvn clean install")
    vim.fn.system("mvn clean install")

    -- Find the name of the latest .war file.
    local latest_file = nil
    local latest_modification_time = 0
    for filename in io.popen("dir /B /A:-D " .. root_directory .. "\\target"):lines() do
      local full_path = root_directory .. "\\target\\" .. filename
      local modification_time = vim.loop.fs_stat(full_path).mtime.sec
      if modification_time > latest_modification_time then
        latest_file = filename
        latest_modification_time = modification_time
      end
    end

    if latest_file then
      -- Log the latest file found.
      -- Logger:error("latest_file = " .. latest_file)

      -- Add the `.war` extension to the file name.
      local war_file_with_extension = string.gsub(latest_file, "%.[^.]+$", ".war")

      -- Log the war file with extension.
      Logger:info("War encontrado: " .. war_file_with_extension)

      -- Find the location of Tomcat's webapps directory using the CATALINA_HOME environment variable.
      local tomcat_webapps = os.getenv("CATALINA_HOME") .. "\\webapps\\"

      -- Run the command to copy the .war file to Tomcat's webapps directory.
      os.execute("copy " .. root_directory .. "\\target\\" .. war_file_with_extension .. " " .. tomcat_webapps)
      Logger:info("War desplegado en: " .. tomcat_webapps)
    else
      -- Log a message if there are no files in the target directory.
      Logger:error("No hay archivos en el directorio target")
    end
  else
    -- Log a message if the root directory is not found.
    Logger:error("No se encontró el directorio raíz del proyecto")
  end
end


function evalExpresion()
  local current_mode = vim.fn.mode()
  if current_mode == 'v' or current_mode == 'V' then
        -- Guardar el contenido del registro visual en el registro "
        vim.cmd([[normal! "vy]])
        -- Obtener el contenido del registro "
        local selected_text = vim.fn.getreg('"')
        -- Escapar los caracteres especiales en el texto seleccionado
        selected_text = vim.fn.escape(selected_text, "'\\")

        -- Copiar el texto seleccionado al portapapeles
        vim.fn.setreg("+", selected_text)

        -- Escapar el contenido del registro "+" para evitar problemas con caracteres especiales
        local escaped_text = vim.fn.escape(selected_text, '"')

        -- Emular la combinación de teclas "+p" para pegar el contenido del registro "+" en el buffer
        local command = string.format(":lua require('dapui').eval(\"%s\")<CR>", escaped_text)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), "n", true)

  else
    -- local ok require("dapui").eval(vim.fn.input("Introduce la expresion: "))
    vim.ui.input({prompt="Introduce la expresion: "}, function(input)
      local ok = require("dapui").eval(input)
      Logger:info(ok)
       end
    )
  end

end


-- MOSTRAR VARIABLE BAJO EL CURSOR
remap("n", "<leader>de", "<cmd>lua evalExpresion()<cr>", bufopts, "Inspeccionar expresión")
remap("v", "<leader>de", "<cmd>lua evalExpresion()<cr>", bufopts, "Inspeccionar expresión")
remap("v", "<leader>de", "<cmd>lua evalExpresion()<cr>", bufopts, "Inspeccionar expresión")
-- Noice
remap("n", "<leader>n", "<cmd>NoiceHistory<cr>", bufopts, "Historial de Noice")
remap("n", "<leader>m", "<cmd>botright messages<cr>", bufopts, "Mensajes")
-- Pintar linea
remap("n", "<F2>", "V:normal! <c-u>HSHighlight 0<cr>", bufopts, "Pintar linea")
remap("n", "<C-F2>", "V:normal! <c-u>HSRmHighlight 0<cr>", bufopts, "Limpiar linea pintada")


require("which-key").register({
  n = {
    name = "Historial de Noice",
  },
}, { prefix = "<leader>" })

require("which-key").register({
  g = {
    name = "Git",
  },
}, { prefix = "<leader>" })

remap("n", "<leader>gc", "<cmd>DiffviewOpen<cr>", bufopts, "Git commit")
remap("n", "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", bufopts, "Alternar archivos de git")
remap("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", bufopts, "Historial de commits")
remap("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", bufopts, "Historial de este archivo")
remap("n", "<leader>gg", "<cmd>Git pull<cr>", bufopts, "Git pull")
remap("n", "<leader>gp", "<cmd>lua git_push()<cr>", bufopts, "Git push")
remap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", bufopts, "Ramas de git")


function git_push()
  total_commits = 0
  vim.cmd("Git push")
end

require("which-key").register({
  t = {
    name = "Tabs",
  },
}, { prefix = "<leader>" })

-- TABS
remap("n", "<leader>ta", ":$tabnew<CR>", bufopts, 'Nueva tab')
remap("n", "<leader>tc", ":tabclose<CR>", bufopts, 'Cerrar tab')
remap("n", "<leader>to", ":tabonly<CR>", bufopts, 'Mover todo a una tab')
remap("n", "<leader>tn", ":tabn<CR>", bufopts, 'Tabn')
remap("n", "<leader>tp", ":tabp<CR>", bufopts, 'Tabp')
remap("n", "<leader>tmp", ":-tabmove<CR>", bufopts, 'Mover tab atrás')
remap("n", "<leader>tmn", ":+tabmove<CR>", bufopts, 'Mover tab adelante')

require("which-key").register({
  s = {
    name = "Sesión",
  },
}, { prefix = "<leader>" })

--SESIONES 
remap("n", "<leader>sd", [[<cmd>lua require("persistence").load()<cr>]], bufopts, "Cargar sesion del directorio")
remap("n", "<leader>ss", [[<cmd>lua require("persistence").load({ last = true })<cr>]], bufopts, "Cargar ultima sesion")
remap("n", "<leader>sq", [[<cmd>lua require("persistence").stop()<cr>]], bufopts, "No guardar sesion al salir")

require("which-key").register({
  b = {
    name = "Buffers",
  },
}, { prefix = "<leader>s" })

--Buffers
remap("n", "<leader>sbp", '<Cmd>BufferLineTogglePin<CR>', bufopts, 'Toggle pin')
remap("n", "<leader>sbP", '<Cmd>BufferLineGroupClose ungrouped<CR>', bufopts, 'Delete non-pinned buffers')
remap("n", "<leader>sbo", '<Cmd>BufferLineCloseOthers<CR>', bufopts, 'Delete other buffers')
remap("n", "<leader>sbr", '<Cmd>BufferLineCloseRight<CR>', bufopts, 'Delete buffers to the right')
remap("n", "<leader>sbl", '<Cmd>BufferLineCloseLeft<CR>', bufopts, 'Delete buffers to the left')
remap("n", "<leader>tp", '<Cmd>BufferLinePick<CR>', bufopts, 'Tab Pick')


function open_explorer()
  local current_directory = vim.fn.expand('%:p:h')
  local explorer_command = 'start explorer "' .. current_directory .. '"'
  vim.fn.system(explorer_command)
end
--Extras
remap("n", "<leader>p", "<cmd>lua open_explorer()<cr>", bufopts, "Abrir explorador")