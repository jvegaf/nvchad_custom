local overrides = require "custom.plugins.overrides"

return {

  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["rcarriga/nvim-notify"] = {},

  ["stevearc/dressing.nvim"] = {
    config = function()
      require "custom.plugins.dressing"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "custom.plugins.telescope"
    end,
    setup = function()
      require("core.utils").load_mappings "telescope"
    end,
  },

  ["nvim-telescope/telescope-project.nvim"] = {},

  ["nvim-telescope/telescope-file-browser.nvim"] = {},

  ["xiyaowong/telescope-emoji.nvim"] = {},

  ["Shatur/neovim-session-manager"] = {
    config = function()
      require "custom.plugins.session-manager"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.whichkey"
    end,
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    config = function()
      require "custom.plugins.nvim-tree"
    end,
  },
  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["simrat39/inlay-hints.nvim"] = {
    config = function()
      require("inlay-hints").setup()
    end,
  },

  ["jose-elias-alvarez/typescript.nvim"] = {
    config = function()
      require "custom.plugins.typescript"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["normen/vim-pio"] = {},

  ["voldikss/vim-browser-search"] = {},

  ["mg979/vim-visual-multi"] = {
    config = function()
      vim.g.VM_leader = ";"
    end,
  },

  ["nvim-treesitter/playground"] = {
    cmd = "TSHighlightCapturesUnderCursor",
  },

  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  ["kdheepak/lazygit.nvim"] = {},

  ["antoinemadec/FixCursorHold.nvim"] = {},

  ["kosayoda/nvim-lightbulb"] = {
    requires = "antoinemadec/FixCursorHold.nvim",
    config = function()
      require "custom.plugins.lightbulb"
    end,
  },
  -- project.nvim
  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require "custom.plugins.project"
    end,
  },

  ["kevinhwang91/nvim-ufo"] = {
    requires = "kevinhwang91/promise-async",
    config = function()
      require "custom.plugins.nvim-ufo"
    end,
  },
}
