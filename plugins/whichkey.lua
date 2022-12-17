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
  b = {
    name = "Buffer",
    a = { "<Cmd>BWipeout other<Cr>", "Delete all buffers" },
    d = { "<Cmd>bd<Cr>", "Delete current buffer" },
    l = { "<Cmd>ls<Cr>", "List buffers" },
    n = { "<Cmd>bn<Cr>", "Next buffer" },
    p = { "<Cmd>bp<Cr>", "Previous buffer" },
    f = { "<Cmd>bd!<Cr>", "Force delete current buffer" },
  },
  f = {
    name = "File",
    b = { "<Cmd>Telescope buffers<Cr>", "Search buffers" },
    c = { "<Cmd>Telescope current_buffer_fuzzy_find<Cr>", "Search current buffer" },
    f = { "<Cmd>Telescope git_files<Cr>", "Git files" },
    g = { "<Cmd>Telescope live_grep<Cr>", "Live grep" },
    h = { "<Cmd>Telescope help_tags<Cr>", "Help" },
    p = { "<Cmd>Telescope file_browser<Cr>", "Pop-up file browser" },
    o = { "<Cmd>Telescope oldfiles<Cr>", "Old files" },
    s = { "<Cmd>Telescope symbols<Cr>", "Symbols" },
    t = { "<Cmd>Telescope<CR>", "Telescope" },
    l = { "<Cmd>e!<CR>", "Reload file" },
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
  p = {
    name = "Project",
    p = {
      "<Cmd>lua require('telescope').extensions.project.project({})<Cr>",
      "List projects",
    },
    r = {
      "<Cmd>Telescope projects<Cr>",
      "Recent projects",
    },
  },
  s = {
    name = "Search",
    b = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find buffer" },
    c = { "q:", "Command history" },
    d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', "dotfiles" },
    e = { "<cmd>Telescope emoji<CR>", "Emoji" },
    f = {
      "viw:lua require('spectre').open_file_search()<Cr>",
      "Open file search",
    },
    g = {
      "<Cmd>lua require('telescope').extensions.arecibo.websearch()<CR>",
      "Web search",
    },
    h = { "q/", "Grep history" },
    l = { "<Cmd>lua require('custom.utils.cheatsheet').cheatsheet()<CR>", "Search code" },
    o = { "<Cmd>SymbolsOutline<CR>", "Symbols Outline" },
    s = { "<Cmd>lua require('spectre').open()<CR>", "Search file" },
    t = { "<cmd>Telescope colorscheme<CR>", "color schemes" },
    u = { "<Cmd>Telescope ultisnips<CR>", "Search snippets" },
    v = {
      "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      "Visual search",
    },
    w = { "<cmd>Telescope grep_string theme=dropdown<CR>", "search word" },
    z = { "<Plug>SearchNormal", "Browser search" },
  },
  S = {
    name = "System",
    b = {
      "<Cmd>hi Normal ctermbg=none guibg=none<CR>",
      "Transparent background",
    },
    d = { "<cmd>Alpha<CR>", "open Dashboard" },
    i = { "<Cmd>PackerStatus<Cr>", "Packer status" },
    s = { "<Cmd>PackerSync<Cr>", "Packer sync" },

    S = { ":<C-u>SaveSession<Cr>", "Save session" },
    L = { ":<C-u>SearchSession<Cr>", "Load session" },
    -- h = { "<Cmd>15sp +term<CR>", "New horizontal terminal" },
    m = {
      function()
        require("telescope").extensions.notify.notify()
      end,
      "Messages",
    },
    t = { "<Cmd>Telescope colorscheme<Cr>", "Color scheme" },
    y = { "<Cmd>Telescope neoclip<Cr>", "Clipboard manager" },
    z = {
      ":e $MYVIMRC | :cd %:p:h <CR>",
      "Configuration",
    },
  },
  t = { name = "Terminal" },
  u = { name = "Update" },
  w = { name = "Workspace" },
  z = { name = "Fold" },
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
