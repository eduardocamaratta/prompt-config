local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Monokai Remastered'

config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = 'DemiBold' })
config.font_size = 12

config.scrollback_lines = 10000

config.window_background_opacity = 0.95
config.window_padding = {
    left = '4px',
    right = '4px',
    top = '4px',
    bottom = '4px'
}

return config