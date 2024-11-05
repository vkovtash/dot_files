local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.color_scheme = 'One Dark'
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Medium' })
config.font_size = 13

config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false

config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"

config.enable_scroll_bar = true

config.window_padding = {
  left = 6,
  right = 12,
  top = 0,
  bottom = 0,
}

return config
