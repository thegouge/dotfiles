-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("Hack")
config.color_scheme = "Ef-Night"
config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.5cell",
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
