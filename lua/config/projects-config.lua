local utils = require('utils')

-- Se resetea las opciones de catalina home al inicio de la sesion
vim.env["CATALINA_OPTS"] = ""

-- Tomcat DEBUG
utils:addEnvVariable("CATALINA_OPTS", "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8080")
utils:addEnvVariable("CATALINA_OPTS", "-Dretiro=C:\\Oracle\\Middleware\\Oracle_Home\\user_projects\\domains\\base_domain\\config\\properties")
