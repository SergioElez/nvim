-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local remap = require("me.util").remap
local bufopts = { silent = true, noremap = true }

-- Salir del modo insertar
remap("i", "jk", "<ESC>", {noremap = true})

-- Cambiar : por ;
remap("", ";", ":", {noremap = true})
remap("", ":", ";", {noremap = true})

-- Guardar archivo
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

-- nvim-dap
remap("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", bufopts, "Set breakpoint")
remap("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", bufopts, "Set conditional breakpoint")
remap("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", bufopts, "Set log point")
remap("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", bufopts, "Clear breakpoints")
remap("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", bufopts, "List breakpoints")

-- Signs para ver todos sign list
vim.fn.sign_define('DapBreakpoint', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected', {text = '', texthl = 'Title', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'WarningMsg', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = ''})
vim.fn.sign_define('DiagnosticSignHint', {text = '󰋼', texthl = 'WarningMsg', linehl = '', numhl = ''})

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

remap("n", "<leader>dww", "<cmd>WildcatUp<cr> | lua enable_auto_scroll()", bufopts, "Wildcat Up")
remap("n", "<leader>dwd", "<cmd>WildcatDown<cr>", bufopts, "Wildcat Down")

local function get_project_path()
  -- Ruta del archivo actual
  local current_file_path = vim.fn.expand('%:p')

  -- Buscar el directorio padre de "src" como la ruta del proyecto
  local project_path = current_file_path
  local src_directory = "/src/"

  local src_index = string.find(project_path, src_directory)
  while src_index do
    project_path = string.sub(project_path, 1, src_index - 1)
    src_index = string.find(project_path, src_directory)
  end

  -- Si no se encuentra el directorio "src", devolver la ruta actual
  if project_path == current_file_path then
    return vim.fn.getcwd()
  end

  return project_path
end


-- remap("n", "<leader>dwr", "<cmd>WildCatRun C:/Users/Sergio/Desktop/demo<cr>", bufopts, "Wildcat Run Project")

-- vim.api.nvim_set_keymap('n', '<leader>dwr', string.format('<cmd>WildCatRun C:/Users/Sergio/Desktop/demo<cr>', get_project_path()), {noremap = true, silent = true})


-- Definir la función para ejecutar WildCatRun en la ruta del proyecto
local function run_wildcat()
  local project_path = "C:/Users/Sergio/Desktop/demo"
  local command = "WildCatRun " .. project_path
  vim.fn.system(command)
end

-- Mapeo para ejecutar WildCatRun en la ruta del proyecto
remap("n", "<leader>dwr", "<cmd>lua run_wildcat()<cr>", bufopts, "Wildcat Run Project")
