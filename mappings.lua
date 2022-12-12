local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<A-j>"] = { ":m .+1<CR>==", "move line down" },
    ["<A-k>"] = { ":m .-2<CR>==", "move line up" },
    ["<A-Down>"] = { ":m .+1<CR>==", "move line down" },
    ["<A-Up>"] = { ":m .-2<CR>==", "move line up" },
  },
  v = {
    ["s"] = { ":'<,'>BrowserSearch<cr>", "Browser Search" },
    -- move lines
    ["<A-j>"] = { "<cmd> :m '>+1<CR>gv=gv", desc = "move line down" },
    ["<A-k>"] = { "<cmd> :m '<-2<CR>gv=gv", desc = "move line up" },
    ["<A-Down>"] = { "<cmd> :m '>+1<CR>gv=gv", desc = "move line down" },
    ["<A-Up>"] = { "<cmd> :m '<-2<CR>gv=gv", desc = "move line up" },
  },
}

-- more keybinds!

return M
