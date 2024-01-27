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
    ["W"] = { "<cmd>write<CR>", "Write Buffer", opts = { nowait = true } },
    ["<leader>ww"] = { "<cmd>write<CR>", "Write Buffer", opts = { nowait = true } },
    ["Q"] = { "<cmd>bdelete<CR>", "close Buffer", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<CR>", "close window", opts = { nowait = true } },
    ["<leader>sc"] = { "<cmd>e $MYVIMRC<CR>", "System config", opts = { nowait = true } },
    ["<leader>sl"] = { "<cmd>Lazy<CR>", "Lazy", opts = { nowait = true } },
    ["<leader>sm"] = { "<cmd>Mason<CR>", "Mason", opts = { nowait = true } },
    ["<leader>sn"] = { "<cmd>messages<CR>", "Messages", opts = { nowait = true } },
    ["<leader>sh"] = { "<cmd>checkhealth<CR>", "System health", opts = { nowait = true } },
    ["<leader>lc"] = { "<cmd>CmpStatus<CR>", "CmpStatus", opts = { nowait = true } },
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "LspInfo", opts = { nowait = true } },
    ["<leader>lr"] = { "<cmd>LspRestart<CR>", "LspRestart", opts = { nowait = true } },
    ["<leader>ll"] = { "<cmd>LspLog<CR>", "LspLog", opts = { nowait = true } },
    ["<ESC>"] = { ":nohlsearch<Bar>:echo<CR>", "Clear search", opts = { nowait = true } },
    -- Git
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "LazyGit", opts = { nowait = true } },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch", opts = { nowait = true } },
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "Checkout commit", opts = { nowait = true } },
    ["<leader>gdc"] = { "<cmd>DiffviewClose<CR>", "DiffviewClose", opts = { nowait = true } },
    ["<leader>gdf"] = { "<cmd>DiffviewFileHistory %<CR>", "File history", opts = { nowait = true } },
    ["<leader>gdg"] = { "<cmd>DiffviewGitLog<CR>", "Git Log", opts = { nowait = true } },
    -- Code Runner
    ["<leader>crf"] = { "<cmd>RunFile<CR>", "Run File", opts = { nowait = true } },
    ["<leader>crt"] = { "<cmd>RunFile tab<CR>", "Run File in tab", opts = { nowait = true } },
    ["<leader>crp"] = { "<cmd>RunProject<CR>", "Run Project", opts = { nowait = true } },
    ["<leader>crc"] = { "<cmd>RunClose<CR>", "Run Close", opts = { nowait = true } },

    ["<leader>xc"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions", opts = { nowait = true } },

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
    ["<A-1>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term" },

    ["<A-2>"] = { function() require("nvterm.terminal").toggle "horizontal" end, "Toggle horizontal term" },

    ["<A-3>"] = { function() require("nvterm.terminal").toggle "vertical" end, "Toggle vertical term" },
  },

  n = {
    -- toggle in normal mode
    ["<A-1>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term" },

    ["<A-2>"] = { function() require("nvterm.terminal").toggle "horizontal" end, "Toggle horizontal term" },

    ["<A-3>"] = { function() require("nvterm.terminal").toggle "vertical" end, "Toggle vertical term" },

    -- new
    ["<leader>1"] = { function() require("nvterm.terminal").new "horizontal" end, "New horizontal term" },

    ["<leader>2"] = { function() require("nvterm.terminal").new "vertical" end, "New vertical term" },
  },
}

return M
