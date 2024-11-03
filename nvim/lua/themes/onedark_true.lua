local M = {}

M.base_30 = {
  one_bg = "#282c34", -- real bg of onedark
  one_bg2 = "#353b45",
  one_bg3 = "#373b43",
  black = "#282c34", --  nvim bg
  black2 = "#1e222a",
  darker_black = "#1b1f27",
  white = "#d7dae0",
  grey = "#42464e",
  grey_fg = "#565c64",
  grey_fg2 = "#6f737b",
  light_grey = "#6f737b",
  red = "#e06c75",
  baby_pink = "#de8c92",
  pink = "#ff75a0",
  line = "#353b45", -- for lines like vertsplit
  green = "#98c379",
  vibrant_green = "#7eca9c",
  nord_blue = "#81a1c1",
  blue = "#61afef",
  yellow = "#e7c787",
  sun = "#ebcb8b",
  purple = "#de98fd",
  dark_purple = "#c882e7",
  teal = "#519aba",
  orange = "#fca2aa",
  cyan = "#a3b8ef",
  statusline_bg = "#22262e",
  lightbg = "#353b45",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = "#282c34",
  base01 = "#353b45",
  base02 = "#42464e",
  base03 = "#565c64",
  base04 = "#6f737b",
  base05 = "#b6bdca",
  base06 = "#c8ccd4",
  base07 = "#d7dae0",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

M.type = "dark"

M = require("base46").override_theme(M, "onedark true")

return M
