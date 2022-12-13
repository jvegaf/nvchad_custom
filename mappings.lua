local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<A-1>"] = { "<cmd>NvimTreeToggle<cr>", "Toogle File Browser" },
    ["<A-j>"] = { ":m .+1<CR>==", "move line down" },
    ["<A-k>"] = { ":m .-2<CR>==", "move line up" },
    ["<A-Down>"] = { ":m .+1<CR>==", "move line down" },
    ["<A-Up>"] = { ":m .-2<CR>==", "move line up" }, -- close buffer + hide terminal buffer
    ["<S-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>gg"] = { "<cmd>LazyGit<cr>", "LazyGit" },
    ["<leader>as"] = { "<cmd>PackerStatus<cr>", "Packer Status" },
    ["<leader>ai"] = { "<cmd>PackerInstall<cr>", "Packer Install" },
    ["<leader>au"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
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

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
}

-- more keybinds!

return M
