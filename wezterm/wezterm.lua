local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.color_scheme = 'One Dark (Gogh)'
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Medium' })
config.font_size = 13

config.hide_tab_bar_if_only_one_tab = true

return config
