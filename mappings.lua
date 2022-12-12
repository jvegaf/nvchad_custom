local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<A-1>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle File Browser" },
    ["<A-j>"] = { ":m .+1<CR>==", "move line down" },
    ["<A-k>"] = { ":m .-2<CR>==", "move line up" },
    ["<A-Down>"] = { ":m .+1<CR>==", "move line down" },
    ["<A-Up>"] = { ":m .-2<CR>==", "move line up" },-- close buffer + hide terminal buffer
    ["<S-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>gg"] = { "<cmd>LazyGit<cr>", "LazyGit"},
  },
  v = {
    ["s"] = { ":'<,'>BrowserSearch<cr>", "Browser Search" },
    -- move lines
    ["<A-j>"] = { "<cmd> :m '>+1<CR>gv=gv", "move line down" },
    ["<A-k>"] = { "<cmd> :m '<-2<CR>gv=gv", "move line up" },
    ["<A-Down>"] = { "<cmd> :m '>+1<CR>gv=gv", "move line down" },
    ["<A-Up>"] = { "<cmd> :m '<-2<CR>gv=gv", "move line up" },
  },
}

-- more keybinds!

return M
