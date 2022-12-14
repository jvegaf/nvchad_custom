local M = {}

M.general = {
  n = {
    ["<A-1>"] = { "<cmd>NvimTreeToggle<cr>", "Toogle File Browser" },
    ["<A-h>"] = { ":MoveHChar(-1)<CR>", "Move Char Left" },
    ["<A-j>"] = { ":MoveLine(1)<CR>", "move line down" },
    ["<A-k>"] = { ":MoveLine(-1)<CR>", "move line up" },
    ["<A-l>"] = { ":MoveHChar(1)<CR>", "Move Char Right" },
    ["<A-Down>"] = { ":MoveLine(1)<CR>", "move line down" },
    ["<A-Up>"] = { ":MoveLine(-1)<CR>", "move line up" }, -- close buffer + hide terminal buffer
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
    ["<A-h>"] = { ":MoveHBlock(-1)<CR>", "Move Char Left" },
    ["<A-l>"] = { ":MoveHBlock(1)<CR>", "Move Char Left" },
    ["<A-j>"] = { ":MoveBlock(1)<CR>", "move block down" },
    ["<A-k>"] = { ":MoveBlock(-1)<CR>", "move block up" },
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
