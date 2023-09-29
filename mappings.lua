---@type MappingsTable
local M = {}

M.disabled = {
  n = {
     ["<leader>fm"] = "",
  },
}

M.general = {
  n = {
    ["vv"] = { "V", "enter visual mode", opts = { nowait = true } },
    ["x"] = { '"_x', "delete character", opts = { nowait = true } },
    ["<C-a>"] = { "gg<S-v>G", "Select all", opts = { nowait = true } },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gq"] = {
        function()
          vim.lsp.buf.format { async = true }
        end,
        "lsp formatting",
      },
    ["<A-Up>"] = { ":m .-2<CR>==", "Move code up", opts = { nowait = true } },
    ["<A-Down>"] = { ":m .+1<CR>==", "Move code down", opts = { nowait = true } },
    ["<A-w>"] = { "<cmd>write<CR>", "Write Buffer", opts = { nowait = true } },
    ["<A-q>"] = { "<cmd>bdelete<CR>", "close Buffer", opts = { nowait = true } },
    ["zz"] = { "<cmd>wq<CR>", "write and close window", opts = { nowait = true } },
    ["<ESC>"] = { ":nohlsearch<Bar>:echo<CR>", "Clear search", opts = { nowait = true } },
  },
  v = {
    ["<A-Down>"] = { ":m '>+1<CR>gv=gv", "Move code down", opts = { nowait = true } },
    ["<A-Up>"] = { ":m '<-2<CR>gv=gv", "Move code up", opts = { nowait = true } },
    ["p"] = { '"_dP', "dont yank in visual paste", opts = { nowait = true } },
  },
  i = {
    ["<A-Down>"] = { "<Esc>:m .+1<CR>==gi", "Move code down", opts = { nowait = true } },
    ["<A-Up>"] = { "<Esc>:m .-2<CR>==gi", "Move code up", opts = { nowait = true } },
    ["jj"] = { "<Esc>", "change to normal mode", opts = { nowait = true } },
  },
  x = {
    ["p"] = { '"_dP', "dont yank in visual paste", opts = { nowait = true } },
  }
}

-- more keybinds!

return M
