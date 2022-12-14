local present, wk = pcall(require, "which-key")

if not present then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
  a = {
    name = "Application",
    d = { "<cmd>Alpha<CR>", "open Dashboard" },
    m = {
      function()
        require("telescope").extensions.notify.notify()
      end,
      "Messages",
    },
  },
  c = {
    name = "Telescope",
    p = {
      function()
        require("telescope").extensions.project.project {}
      end,
      "Project",
    },
    t = { "<cmd>Telescope colorscheme<CR>", "Themes" },
  },
  f = {
    name = "Find",
    c = { "<cmd>Telescope colorscheme<CR>", "color schemes" },
    e = { "<cmd>Telescope emoji<CR>", "Emoji" },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', "dotfiles" },
    h = { "<cmd>Telescope oldfiles hidden=true<CR>", "file history" },
    H = { '<cmd>lua require("plugins.telescope").command_history()<CR>', "command history" },
    s = { "<cmd>Telescope search_history theme=dropdown<CR>", "search history" },
    w = { "<cmd>Telescope grep_string theme=dropdown<CR>", "search word" },
  },
  g = { name = "Git" },
  l = {
    name = "LSP",
    a = { "code action" },
    d = { "<cmd>TroubleToggle<CR>", "local diagnostics" },
    D = { "<cmd>Telescope diagnostics wrap_results=true<CR>", "workspace diagnostics" },
    f = { "format" },
    l = { "line diagnostics" },
    r = { "rename" },
    t = { "<cmd>LspToggleAutoFormat<CR>", "toggle format on save" },
  },
  p = { name = "Picker" },
  s = {
    name = "Session",
    c = { "<cmd>SessionManager load_session<CR>", "choose session" },
    r = { "<cmd>SessionManager delete_session<CR>", "remove session" },
    d = { "<cmd>SessionManager load_current_dir_session<CR>", "load current dir session" },
    l = { "<cmd>SessionManager load_last_session<CR>", "load last session" },
    s = { "<cmd>SessionManager save_current_session<CR>", "save session" },
  },
  t = { name = "Terminal" },
  u = { name = "Update" },
  w = { name = "Workspace" },
}

local visual_mode_mappings = {
  -- single
  ["s"] = { "<cmd>'<,'>sort<CR>", "sort" },

  a = {
    name = "Actions",
    c = { "comment box" },
  },

  c = {
    name = "LSP",
    a = { "range code action" },
    f = { "range format" },
  },

  g = {
    name = "Git",
    h = {
      name = "Hunk",
      r = "reset hunk",
      s = "stage hunk",
    },
  },

  p = {
    name = "Project",
    r = { "refactor" },
  },

  t = {
    name = "Table Mode",
    t = { "tableize" },
  },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Register                                                 │
-- ╰──────────────────────────────────────────────────────────╯

wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, visual_opts)

local function attach_typescript(bufnr)
  wk.register({
    c = {
      name = "LSP",
      F = { "<cmd>TypescriptFixAll<CR>", "fix all" },
      i = { "<cmd>TypescriptAddMissingImports<CR>", "import all" },
      o = { "<cmd>TypescriptOrganizeImports<CR>", "organize imports" },
      u = { "<cmd>TypescriptRemoveUnused<CR>", "remove unused" },
    },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_npm(bufnr)
  wk.register({
    n = {
      name = "NPM",
      c = { '<cmd>lua require("package-info").change_version()<CR>', "change version" },
      d = { '<cmd>lua require("package-info").delete()<CR>', "delete package" },
      h = { "<cmd>lua require('package-info').hide()<CR>", "hide" },
      i = { '<cmd>lua require("package-info").install()<CR>', "install new package" },
      r = { '<cmd>lua require("package-info").reinstall()<CR>', "reinstall dependencies" },
      s = { '<cmd>lua require("package-info").show()<CR>', "show" },
      u = { '<cmd>lua require("package-info").update()<CR>', "update package" },
    },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

local function attach_jest(bufnr)
  wk.register({
    j = {
      name = "Jest",
      f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "run current file" },
      i = { '<cmd>lua require("neotest").summary.toggle()<CR>', "toggle info panel" },
      j = { '<cmd>lua require("neotest").run.run()<CR>', "run nearest test" },
      l = { '<cmd>lua require("neotest").run.run_last()<CR>', "run last test" },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', "open test output" },
      s = { '<cmd>lua require("neotest").run.stop()<CR>', "stop" },
    },
  }, {
    buffer = bufnr,
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  })
end

return {
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_jest = attach_jest,
}
