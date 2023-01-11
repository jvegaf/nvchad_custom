local M = {}

-- Path to overriding theme and highlights files
local themes = require "custom.overidden_themes"
local highlights = require "custom.highlights"

M.plugins = require "custom.plugins"

M.ui = {
  theme_toggle = { "onedark", "one_light", "gruvbox", "nightfox" },
  theme = "nightfox",
  changed_themes = themes,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- vim.cmd [[ colorscheme onedark ]]
-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
