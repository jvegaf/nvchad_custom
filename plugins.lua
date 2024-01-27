local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.nvim-lint"
    end,
  },

  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- jdtls
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "custom.configs.jdtls"
    end,
  },
  {
    "simaxme/java.nvim",
    ft = { "java" },
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "Exafunction/codeium.vim",
    enabled = false,
    event = "InsertEnter",
    -- stylua: ignore
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<A-l>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<A-j>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<A-k>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<A-h>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
    end,
  },
  {
    "LunarVim/bigfile.nvim",
  },
  {

    "ethanholz/nvim-lastplace",
  },
  {
    "sontungexpt/url-open",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup {}

      vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")
    end,
  },
  {
    "Wansmer/treesj",
    keys = { { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Split Join" } },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "voldikss/vim-browser-search",
    lazy = false,
    keys = { { "<A-s>", ":'<,'>BrowserSearch<cr>", mode = "v", desc = "Search on web" } },
  },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      "<C-Up>",
      "<C-Down>",
      "<S-Up>",
      "<S-Down>",
      "<S-Left>",
      "<S-Right>",
    },
    config = function()
      vim.g.VM_leader = ";"
    end,
  },

  -- trouble
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous { skip_groups = true, jump = true }
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next { skip_groups = true, jump = true }
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
    config = function()
      require "custom.configs.nvim-ufo"
    end,
  },
  {
    "junegunn/vim-easy-align",
    event = "User BufReadPre",
    keys = { { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" } },
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keymaps = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle" },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      name = {
        "venv",
        ".venv",
        "env",
        ".env",
      },
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Venv Select" },
    },
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      {
        "saecki/crates.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          require("crates").setup()
        end,
      },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-git",
    },
    opts = overrides.cmp,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "mfussenegger/nvim-dap-python",
      "anuvyklack/hydra.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "rcarriga/cmp-dap",
    },
    keys = {
      { "<leader>dd", desc = "Open Debug menu" },
      -- stylua: ignore
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug Method", ft = "python" },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "mfussenegger/nvim-dap",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
      },
    },
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run File",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.loop.cwd())
        end,
        desc = "Run All Test Files",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true, auto_close = true }
        end,
        desc = "Show Output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run { strategy = "dap" }
        end,
        desc = "Debug Nearest",
      },
    },
  },
}

return plugins
