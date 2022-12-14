local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvimtree.setup {
  hijack_cursor = true,
  open_on_setup = true,
  open_on_setup_file = true,
  sync_root_with_cwd = true,
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = { "<2-RightMouse>", "<C-]>" }, action = "" }, -- cd
        { key = "<C-v>", action = "" }, -- vsplit
        { key = "<C-x>", action = "" }, -- split
        { key = "<C-t>", action = "" }, -- tabnew
        { key = "<BS>", action = "" }, -- close_node
        { key = "<Tab>", action = "" }, -- preview
        { key = "D", action = "" }, -- trash
        { key = "[e", action = "" }, -- prev_diag_item
        { key = "]e", action = "" }, -- next_diag_item
        { key = "[c", action = "" }, -- prev_git_item
        { key = "]c", action = "" }, -- next_git_item
        { key = "-", action = "" }, -- dir_up
        { key = "s", action = "" }, -- system_open
        { key = "W", action = "" }, -- collapse_all
        { key = "r", action = "rename" }, -- toggle_help
        { key = "c", action = "cd" },
        { key = "d", action = "remove" }, -- cut
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all" },
        { key = "t", action = "cut" },
        { key = "<Space>p", action = "prev_diag_item" },
        { key = "<Space>.", action = "next_diag_item" },
        { key = "<Space>k", action = "prev_git_item" },
        { key = "<Space>j", action = "next_git_item" },
        { key = "u", action = "dir_up" },
        { key = "?", action = "toggle_help" },
      },
    },
  },
  renderer = {
    full_name = true,
    group_empty = true,
    special_files = {},
    symlink_destination = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "signcolumn",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = { "help" },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    custom = {
      "^.git$",
    },
  },
  actions = {
    change_dir = {
      enable = true,
      restrict_above_cwd = false,
    },
    open_file = {
      resize_window = true,
      window_picker = {
        chars = "aoeui",
      },
    },
    remove_file = {
      close_window = false,
    },
  },
  log = {
    enable = false,
    truncate = true,
    types = {
      all = false,
      config = true,
      copy_paste = false,
      diagnostics = true,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}
