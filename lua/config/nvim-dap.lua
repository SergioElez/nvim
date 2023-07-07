local java_home = os.getenv('JAVA_HOME')
require('dap.ext.vscode').load_launchjs()

local dap = require('dap')
dap.defaults.fallback.terminal_win_cmd = 'tabnew'

-- nuevo
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}


