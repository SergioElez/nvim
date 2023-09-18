require("nvim-web-devicons").setup {
  strict = true,
  override = {
    folder = {
      color = "#F66B42"
    }
   },
  override_by_filename = {
    [".git"] = {
      icon = "",
      color = "#ff0000",
      name = "Gitignore"
    },
    [".github"] = {
      icon = "",
      color = "#ff0000",
      name = "Github"
    },
    ["config"] = {
      icon = "",
      color = "#e6db74",
      name = "Config"
   },
   ["node_modules"] = {
    icon = "",
    color = "#e6db74",
    name = "node_modules"
   },
   ["img"] = {
    icon = "󰉏",
    color = "#e6db74",
    name = "Images"
   },
   ["resources"] = {
    icon = "󱋣",
    color = "#e6db74",
    name = "resources"
   },
   ["target"] = {
    icon = "󰉒",
    color = "#e6db74",
    name = "target"
   },
   ["core"] = {
    icon = "",
    color = "#e6db74",
    name = "core"
   },
  }
}