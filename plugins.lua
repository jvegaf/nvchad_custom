local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {

    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    opts = function(_, opts)
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      os.execute("mkdir " .. workspace_dir)

      local configs = require "plugins.configs.lspconfig"
      local on_attach = configs.on_attach
      -- get the current OS
      local os
      if vim.fn.has "mac" == 1 then
        os = "mac"
      elseif vim.fn.has "unix" == 1 then
        os = "linux"
      elseif vim.fn.has "win32" == 1 then
        os = "win"
      end

      local defaults = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.expand "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
          "-configuration",
          vim.fn.expand "$MASON/share/jdtls/config",
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
            },
            maven = {
              downloadSources = true,
            },

            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
          },
          signatureHelp = {

            enabled = true,
          },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        },
        init_options = {
          bundles = {
            vim.fn.expand "$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
            -- unpack remaining bundles
            (table.unpack or unpack)(vim.split(vim.fn.glob "$MASON/share/java-test/*.jar", "\n", {})),
          },
        },
        handlers = {
          ["$/progress"] = function()
            -- disable progress updates.
          end,
        },
        filetypes = { "java" },
        on_attach = function(client, bufnr)
          require("jdtls").setup_dap { hotcodereplace = "auto" }
          on_attach(client, bufnr)
        end,
      }

      -- TODO: add overwrite for on_attach

      -- ensure that table is valid
      if not opts then
        opts = {}
      end

      -- extend the current table with the defaults keeping options in the user opts
      -- this allows users to pass opts through an opts table in community.lua
      opts = vim.tbl_deep_extend("keep", opts, defaults)

      -- send opts to config
      return opts
    end,
    config = function(_, opts)
      -- setup autocmd on filetype detect java
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "java", -- autocmd to start jdtls
        callback = function()
          if opts.root_dir and opts.root_dir ~= "" then
            require("jdtls").start_or_attach(opts)
            -- require('jdtls.dap').setup_dap_main_class_configs()
          else
            require("astronvim.utils").notify(
              "jdtls: root_dir not found. Please specify a root marker",
              vim.log.levels.ERROR
            )
          end
        end,
      })
      -- create autocmd to load main class configs on LspAttach.
      -- This ensures that the LSP is fully attached.
      -- See https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration
      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = "*.java",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- ensure that only the jdtls client is activated
          if client.name == "jdtls" then
            require("jdtls.dap").setup_dap_main_class_configs()
          end
        end,
      })
    end,
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

  -- Install a plugin

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
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

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function()
      local M = require "plugins.configs.cmp"
      local cmp = M.cmp
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      -- table.insert(M.sources, { name = "emoji" })
      M.sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "emoji", group_index = 2 },
        { name = "path", group_index = 2 },
      }
      return M
    end,
  },
  {
    "abecodes/tabout.nvim",
    opts = {
      tabkey = "<tab>", -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = "<s-tab>", -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = "<C-d>", -- reverse shift default action,
      enable_backwards = false, -- well ...
      completion = true, -- if the tabkey is used in a completion pum
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
      },
      ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = { "markdown" }, -- tabout will ignore these filetypes
    },
    {
      "kdheepak/lazygit.nvim",
      event = "VeryLazy",
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      keymaps = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "anuvyklack/hydra.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "rcarriga/cmp-dap",
    },
    keys = { { "<leader>dd", desc = "Open Debug menu" } },
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
