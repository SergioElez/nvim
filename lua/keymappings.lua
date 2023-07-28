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
remap("n", "<C-s>", "vapJgqap<cmd>update<cr>")
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
require("which-key").register({
  t = {
    name = "tabs",
  },
})

-- window management
remap("n", "<C-Right>", "<cmd>:vertical resize -1<cr>", bufopts, "Minimize window")
remap("n", "<C-Left>", "<cmd>:vertical resize +1<cr>", bufopts, "Maximize window")

-- formatting
remap("n", "Q", "gqap", bufopts, "Format paragraph")
remap("x", "Q", "gq", bufopts, "Format paragraph")
remap("n", "<leader>Q", "vapJgqap", bufopts, "Merge paragraphs")

--
-- Plugins
--

-- vim-marked
remap("n", "<leader>mo", "<cmd>MarkedOpen<cr>", bufopts, "Open marked")

-- vim-pencil
remap("n", "<leader>qc", "<Plug>ReplaceWithCurly", bufopts, "Curl quotes")
remap("n", "<leader>qs", "<Plug>ReplaceWithStraight", bufopts, "Straighten quotes")

-- telescope
remap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", bufopts, "Find file")
remap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", bufopts, "Grep")
remap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", bufopts, "Find buffer")
remap("n", "<leader>fm", "<cmd>Telescope marks<cr>", bufopts, "Find mark")
remap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", bufopts, "Find references (LSP)")
remap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", bufopts, "Find symbols (LSP)")
remap("n", "<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", bufopts, "Find incoming calls (LSP)")
remap("n", "<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", bufopts, "Find outgoing calls (LSP)")
remap("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", bufopts, "Find implementations (LSP)")
remap("n", "<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", bufopts, "Find errors (LSP)")
require("which-key").register({
  f = {
    name = "find",
  },
}, { prefix = "<leader>" })

-- trouble
remap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", bufopts, "Display errors")
remap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", bufopts, "Display workspace errors")
remap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", bufopts, "Display document errors")
require("which-key").register({
  x = {
    name = "errors",
  },
}, { prefix = "<leader>" })

-- symbols-outline
remap("n", "<leader>o", "<cmd>SymbolsOutline<cr>", bufopts, "Show symbols")

-- NerdTree
remap("n", "<leader><leader>", "<cmd>NERDTreeToggle<cr>", bufopts, "Oil")

-- vim-test
remap("n", "<leader>vt", "<cmd>TestNearest<cr>", bufopts, "Test nearest")
remap("n", "<leader>vf", "<cmd>TestFile<cr>", bufopts, "Test file")
remap("n", "<leader>vs", "<cmd>TestSuite<cr>", bufopts, "Test suite")
remap("n", "<leader>vl", "<cmd>TestLast<cr>", bufopts, "Test last")
remap("n", "<leader>vg", "<cmd>TestVisit<cr>", bufopts, "Go to test")
require("which-key").register({
  v = {
    name = "test",
  },
}, { prefix = "<leader>" })


remap("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", bufopts, "Set breakpoint")
remap("n", "<leader>bb", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", bufopts, "Set breakpoint")

remap("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", bufopts, "Set conditional breakpoint")
remap("n", "<leader>bc", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", bufopts, "Set conditional breakpoint")
-- vim.api.nvim_set_keymap("n", "<leader>bc", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", { noremap = true, silent = true })

remap("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", bufopts, "Clear breakpoints")
remap("n", "<leader>br", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", bufopts, "Clear breakpoints")
-- vim.api.nvim_set_keymap("n", "<leader>br", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", { noremap = true, silent = true })

remap("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", bufopts, "Set log point")
remap("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", bufopts, "List breakpoints")


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
vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})

require("which-key").register({
  u = {
    name = "DAP UI",
  },
}, { prefix = "<leader>d" })

remap('n', '<leader>dui', ':lua require("dapui").toggle()<CR>', bufopts, 'Toggle UI')
remap('n', '<leader>dus', ':lua require("dapui").toggle("sidebar")<CR>', bufopts, 'Toggle sidebar')
remap('n', '<leader>dut', ':lua require("dapui").toggle("tray")<CR>', bufopts, 'Toggle tray')

-- DAP Widgets
remap('n', '<leader>dwu', require('dap.ui.widgets').hover, bufopts, 'Show expression under cursor')
remap('n', '<leader>dws',
    ':lua local widgets=require("dap.ui.widgets");widgets.sidebar(widgets.scopes).open()<CR>', bufopts,
    'Show scopes')
remap('n', '<leader>dwf',
    ':lua local widgets=require("dap.ui.widgets");widgets.sidebar(widgets.frames).open()<CR>', bufopts,
    'Show frames')

require("which-key").register({
  b = {
    name = "breakpoints",
  },
}, { prefix = "<leader>" })

remap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", bufopts, "Continue")
remap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", bufopts, "Step over")

remap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", bufopts, "Continue")
remap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", bufopts, "Step over")
remap("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", bufopts, "Step into")
remap("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", bufopts, "Step out")
remap("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", bufopts, "Disconnect")
remap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", bufopts, "Terminate")
remap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", bufopts, "Open REPL")
remap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", bufopts, "Run last")
remap("n", "<leader>di", function() require"dap.ui.widgets".hover() end, bufopts, "Variables")
remap("n", "<leader>d?", function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, bufopts, "Scopes")
remap("n", "<leader>df", "<cmd>Telescope dap frames<cr>", bufopts, "List frames")
remap("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", bufopts, "List commands")


require("which-key").register({
  d = {
    name = "debug",
  },
}, { prefix = "<leader>" })

require("which-key").register({
  w = {
    name = "Wildcat",
  },
}, { prefix = "<leader>d" })

local function enable_auto_scroll()
  -- vim.api.nvim_win_set_option(0, 'scrollbind', true)
  -- vim.api.nvim_win_set_option(0, 'scrolljump', 1)
  -- vim.cmd('autocmd WinScrolled * if &scrollbind | scrollbind | endif')
  vim.api.nvim_command("scroll 9999")
end

-- vim.api.nvim_command([[function! scroll_auto() | silent! scroll 9999 | endfunction]])
-- vim.api.nvim_command([[autocmd User WildcatUp call scroll_auto()]])

local winid = nil
function deploy_tomcat()
  port = "8080"
  local result = vim.fn.systemlist('netstat -ano | findstr :' .. port)
  ocuped = #result > 0
  
  for _, line in ipairs(result) do
    local listening_pos = line:find("LISTENING")
  end
  Logger:info(listening_pos)
  
  if(ocuped and listening_pos) then
    Logger:error("El puerto: " .. port .. " esta ocupado, relanza el despliegue")
    
    
    -- winid = vim.api.nvim_get_current_win()
    
    -- Logger:info("Se cierra de ventana")
    -- vim.api.nvim_win_close(winid, true);
    
    for _, line in ipairs(result) do
      local listening_pos = line:find("LISTENING")
      if listening_pos then
          local pid_str = line:sub(listening_pos + 10):match("(%d+)")
          if pid_str then
              local pid = tonumber(pid_str)
              if pid then
                  local kill_command = string.format('taskkill /PID %d /F', pid)
                  vim.cmd('!' .. kill_command)
                  Logger:info(kill_command)
                  
              end
          end
      end
    end
    
    -- deploy_tomcat()

  else
    vim.cmd("silent! WildcatUp")
    term_colors()
    winid = vim.api.nvim_get_current_win()
    
    -- vim.cmd.sleep(2)
    
    -- local result = vim.fn.systemlist('netstat -ano | findstr :' .. port)
    -- ocuped = #result > 0
    -- if(not ocuped) then
      -- Logger:info("OCUPADO")
      -- deploy_tomcat()
    -- else
      -- Logger:info("no OCUPADO")
      
      -- vim.cmd('normal! G$')
      -- vim.cmd("wincmd w")
      vim.cmd('startinsert | stopinsert')
      
      -- SI ESTA ESCUCHANDO EN EL puerto 8080
      -- require'dap'.continue()
    -- end
    
    
    -- vim.api.nvim_set_keymap('n', '<C-w>w', '<Cmd>wincmd w<CR>', { noremap = true, silent = true })
  end
  
end


remap("n", "<F4>", "<cmd>lua deploy_tomcat()<cr>", bufopts, "Wildcat Up")
remap("n", "<leader>dww", "<cmd>lua deploy_tomcat()<cr>", bufopts, "Wildcat Up")
remap("n", "<leader>dwd", "<cmd>WildcatDown<cr>", bufopts, "Wildcat Down")

-- DESPLIEGUE DE WAR A TOMCAT
remap("n", "<leader>dwr", "<cmd>lua deploy_to_tomcat()<cr>", bufopts, "Desplegar war a Tomcat")

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
remap("n", "<leader>de", "<cmd>lua evalExpresion()<cr>", bufopts, "Inspeccionar expresion")
remap("v", "<leader>de", "<cmd>lua evalExpresion()<cr>", bufopts, "Inspeccionar expresion")

-- Salir de toggle term con ESC
remap("t", "<esc>", "<cmd>ToggleTerm<cr>", bufopts, "ToggleTerm")

function ClearTerminal()
  vim.fn.termopen("sed 's/\\[8080\\]/\\x1b[31m&\\x1b[0m/'", { on_exit = function() vim.cmd('redraw') end })
end


-- remap("t", "<leader>tc", [[<C-\><C-n>:silent !clear<CR>]], bufopts, "Inspeccionar expresion")
vim.api.nvim_set_keymap('t', '<f2>', "<cmd>lua ClearTerminal()<cr>", { noremap = true })

remap("n", "<leader>n", "<cmd>NoiceHistory<cr>", bufopts, "Noice History")
