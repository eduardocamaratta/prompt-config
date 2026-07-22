--
-- Copyright © 2026 Eduardo Camaratta
--
-- This file is part of Prompt Config.
--
-- Prompt Config is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
--
-- Prompt Config is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License along with Prompt Config. If not, see <https://www.gnu.org/licenses/>.
--

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