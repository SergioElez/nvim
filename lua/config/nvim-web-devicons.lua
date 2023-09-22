local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',


  bg_inactive = "#2f3336",
  bg = "#3E4347",
  fg = "#f8f8f2",
  fg_gutter = "#808080",
  comment = "#7e8e91",
  blue = "#ffffff",
  cyan = "#6694EF",
  magenta = "#f92672",
  purple = "#ae81ff",
  orange = "#fd971f",
  yellow = "#e6db74",
  green = "#8AC21B",
  springgreen = "#00ff87",
  red = "#ff4a44",
  
  teal = "#3AC1A8",
  lavender = "#B57EDC",
  goldenyellow = "#F7C547",
  pastelpink = "#FF9AA2",
  navyblue = "#1B365D",
  limagreen = "#C7FF46",
  burntorange = "#FF6B24",
  deeppurple = "#6E1E6E",
  emeraldgreen = "#00965E",
  crimsonred = "#E60026"
}

require("nvim-web-devicons").setup {
  strict = true,
  -- override = {
    -- folder = {
      -- color = "#F66B42"
    -- }
  --  },
  override_by_filename = {
    [".git"] = {
      icon = "",
      color = "#ff0000",
      name = "Gitignore"
    },
    [".github"] = {
      icon = "",
      color = colors.cyan,
      name = "Github"
    },
    ["config"] = {
      icon = "",
      color = colors.cyan,
      name = "Config"
   },
   ["node_modules"] = {
    icon = "",
    color = colors.green,
    name = "node_modules"
   },
   ["img"] = {
    icon = "󰉏",
    color = colors.green,
    name = "Images"
   },
   ["images"] = {
    icon = "󰉏",
    color = colors.green,
    name = "Images"
   },
   ["screenshots"] = {
    icon = "󰉏",
    color = colors.green,
    name = "Images"
   },
   ["resources"] = {
    icon = "󱋣",
    color = colors.purple,
    name = "resources"
   },
   ["assets"] = {
    icon = "󱋣",
    color = colors.yellow,
    name = "assets"
   },
   ["asset"] = {
    icon = "󱋣",
    color = colors.yellow,
    name = "asset"
   },
   ["target"] = {
    icon = "󰉒",
    color = colors.red,
    name = "target"
   },
   ["dist"] = {
    icon = "󰉒",
    color = colors.red,
    name = "target"
   },
   ["core"] = {
    icon = "",
    color = colors.cyan,
    name = "core"
   },
   ["java"] = {
    icon = "",
    color = colors.red,
    name = "java"
   },
   ["app"] = {
    icon = "󱂵",
    color = colors.red,
    name = "app"
   },
   ["src"] = {
    icon = "󱧶",
    color = colors.purple,
    name = "src"
   },
   ["home"] = {
    icon = "󱂵",
    color = colors.cyan,
    name = "home"
   },
   ["controller"] = {
    icon = "󱧶",
    color = colors.orange,
    name = "controller"
   },
   ["controllers"] = {
    icon = "󱧶",
    color = colors.orange,
    name = "controllers"
   },
   ["view"] = {
    icon = "󱞊",
    color = colors.cyan,
    name = "view"
   },
   ["util"] = {
    icon = "󱧶",
    color = colors.orange,
    name = "util"
   },
   ["utils"] = {
    icon = "󱧶",
    color = colors.orange,
    name = "utils"
   },
   ["service"] = {
    icon = "󱧶",
    color = colors.magenta,
    name = "service"
   },
   ["services"] = {
    icon = "󱧶",
    color = colors.magenta,
    name = "services"
   },
   ["model"] = {
    icon = "󰉌",
    color = colors.springgreen,
    name = "model"
   },
   ["models"] = {
    icon = "󰉌",
    color = colors.springgreen,
    name = "models"
   },
   ["main"] = {
    icon = "󱂵",
    color = colors.cyan,
    name = "main"
   },
   ["test"] = {
    icon = "󱥾",
    color = colors.green,
    name = "test"
   },
   ["bin"] = {
    icon = "󰛫",
    color = colors.cyan,
    name = "bin"
   },
   ["build"] = {
    icon = "󰛫",
    color = colors.cyan,
    name = "build"
   },
   ["dto"] = {
    icon = "󰛫",
    color = colors.cyan,
    name = "dto"
   },
   ["properties"] = {
    icon = "󱧼",
    color = colors.springgreen,
    name = "properties"
   },
   ["propertie"] = {
    icon = "󱧼",
    color = colors.springgreen,
    name = "propertie"
   },
   ["exceptions"] = {
    icon = "󰉘",
    color = colors.red,
    name = "exceptions"
   },
   ["security"] = {
    icon = "󰢬",
    color = colors.purple,
    name = "security"
   },
   ["rest"] = {
    icon = "󰾶",
    color = colors.yellow,
    name = "rest"
   },
   ["entities"] = {
    icon = "󰉌",
    color = colors.green,
    name = "entities"
   },
   ["repositories"] = {
    icon = "󱋣",
    color = colors.red,
    name = "repositories"
   },
   ["constants"] = {
    icon = "󰉐",
    color = colors.green,
    name = "constants"
   },
   ["client"] = {
    icon = "󰡰",
    color = colors.magenta,
    name = "client"
   },
   ["policy"] = {
    icon = "󱂷",
    color = colors.red,
    name = "policy"
   },
   ["impl"] = {
    icon = "󰉒",
    color = colors.green,
    name = "impl"
   },
  }
}