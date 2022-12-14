local present, legendary = pcall(require, "legendary")

if not present then
  return
end

legendary.setup {
  include_builtin = true,
  auto_register_which_key = true,
}

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map("n", "<C-p>", "<cmd>lua require('legendary').find()<CR>", default_opts)
