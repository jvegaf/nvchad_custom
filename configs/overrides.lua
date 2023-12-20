local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "java",
    "xml",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    --java
    "jdtls",
    "lemminx",
  },
}

local api = require "nvim-tree.api"
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)

local function my_on_attach(bufnr)
  local function edit_or_open()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file
      api.node.open.edit()
      -- Close the tree if file was opened
      api.tree.close()
    end
  end

  -- open as vsplit on current node
  local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file as vsplit
      api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", edit_or_open, opts "Edit Or Open")
  vim.keymap.set("n", "L", vsplit_preview, opts "Vsplit Preview")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Folder")
  vim.keymap.set("n", "H", api.node.navigate.parent, opts "Parent")
end

-- git support in nvimtree
M.nvimtree = {
  hijack_cursor = true,
  filters = {
    git_ignored = false,
    exclude = {},
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = false,
    },
  },
  view = {
    width = 40,
    relativenumber = true,
  },
  git = {
    enable = true,
    timeout = 500,
  },
  on_attach = my_on_attach,
  renderer = {
    highlight_git = true,
    root_folder_label = true,
    icons = {
      show = {
        git = true,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M
