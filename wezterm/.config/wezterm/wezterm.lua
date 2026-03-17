-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
config.color_scheme = 'rose-pine-moon'

config.enable_tab_bar = true
config.use_fancy_tab_bar  = false

local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
modal.apply_to_config(config)
modal.set_default_keys(config)

--wezterm.plugin
--  .require('https://github.com/yriveiro/wezterm-status')
--  .apply_to_config(config, {
--    cells = {
--      battery = { enabled = false },
--      date = { enabled = false, format = '%H:%M' },
--      mode = { enabled = true },
--  }})

-- Finally, return the configuration to wezterm:
return config
