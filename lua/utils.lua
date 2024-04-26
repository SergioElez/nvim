local M = {}

function M.find_project_root()
  local cwd = vim.fn.getcwd()

  local function has_target_directory(path)
    local target_path = path .. "/target"
    return vim.loop.fs_stat(target_path) and true or false
  end

  local root_directory = cwd
  while not has_target_directory(root_directory) do
    local parent_directory = vim.fn.fnamemodify(root_directory, ":h")
    if parent_directory == root_directory then
      -- Reached the root of the file system, 'target' directory not found.
      root_directory = nil
      break
    end
    root_directory = parent_directory
  end

  print('root '..root_directory)
  return root_directory
end

-- LOGGER

local function logger(plugin_name, msg)
    return function(level)
        if plugin_name then
            msg = string.format("[%s]   %s", plugin_name, msg)
        end
        vim.notify(msg, level)
    end
end

function M:new(plugin_name)
    local table = {}
    self.__index = self
    table.plugin_name = plugin_name
    setmetatable(table, self)
    return table
end

function M:warn(msg)
    logger(self.plugin_name, msg)(vim.log.levels.WARN)
end

function M:error(msg)
    logger(self.plugin_name, msg)(vim.log.levels.ERROR)
end

function M:info(msg)
    logger(self.plugin_name, msg)(vim.log.levels.INFO)
end

function M:addEnvVariable(name, value)
  local currentValue = vim.env[name]
  
  if(currentValue) then
    value = currentValue .. " " .. value
  end
  
  vim.env[name] = value
  os.execute('set ' .. name .. '=' .. vim.env[name])
end

return M