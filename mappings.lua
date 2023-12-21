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
    -- ["gq"] = {
    --     function()
    --       vim.lsp.buf.format { async = true }
    --     end,
    --     "lsp formatting",
    --   },
    ["gq"] = { "<cmd>Format<CR>", "lsp formatting", opts = { nowait = true } },
    ["<A-k>"] = { ":m .-2<CR>==", "Move code up", opts = { nowait = true } },
    ["<A-j>"] = { ":m .+1<CR>==", "Move code down", opts = { nowait = true } },
    ["<A-w>"] = { "<cmd>write<CR>", "Write Buffer", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd>write<CR>", "Write Buffer", opts = { nowait = true } },
    ["<A-q>"] = { "<cmd>bdelete<CR>", "close Buffer", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<CR>", "close window", opts = { nowait = true } },
    ["<leader>sc"] = { "<cmd>e $MYVIMRC<CR>", "System config", opts = { nowait = true } },
    ["<leader>sh"] = { "<cmd>checkhealth<CR>", "System health", opts = { nowait = true } },
    ["<leader>lc"] = { "<cmd>CmpStatus<CR>", "CmpStatus", opts = { nowait = true } },
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "LspInfo", opts = { nowait = true } },
    ["<ESC>"] = { ":nohlsearch<Bar>:echo<CR>", "Clear search", opts = { nowait = true } },
  },
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move code down", opts = { nowait = true } },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move code up", opts = { nowait = true } },
    ["p"] = { '"_dP', "dont yank in visual paste", opts = { nowait = true } },
  },
  i = {
    -- ["<A-Down>"] = { "<Esc>:m .+1<CR>==gi", "Move code down", opts = { nowait = true } },
    -- ["<A-Up>"] = { "<Esc>:m .-2<CR>==gi", "Move code up", opts = { nowait = true } },
    ["jk"] = { "<Esc>", "change to normal mode", opts = { nowait = true } },
  },
  x = {
    ["p"] = { '"_dP', "dont yank in visual paste", opts = { nowait = true } },
  }
}

-- more keybinds!

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-1>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-2>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-3>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-1>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-2>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-3>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>1"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>2"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

return M
