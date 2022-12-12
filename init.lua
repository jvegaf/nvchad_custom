local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local has = function(x) return vim.fn.has(x) == 1 end

local is_win = has "win32"
-- local is_lin = has "linux"

if is_win then require "custom.windows" end

-- if is_lin then require "custom.linux" end

vim.g.autoformat_enabled = true

