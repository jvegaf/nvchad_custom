local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("discontinue_comments", { clear = true })

augroup("general", { clear = true })
augroup("YankHighlight", { clear = true })

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = "YankHighlight",
  pattern = "*",
})

autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  group = "general",
  desc = "Disable New Line Comment",
})

-- autocmd({ "FileType" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.opt.formatoptions = vim.opt.formatoptions - "o"
--   end,
--   group = "discontinue_comments",
--   desc = "Dont't continue comments with o/O",
-- })

augroup("lsp_attach_auto_diag", { clear = true })

autocmd("LspAttach", {
  group = "lsp_attach_auto_diag",
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    -- create the autocmd to show diagnostics
    autocmd("CursorHold", {
      group = "lsp_attach_auto_diag",
      buffer = buffer,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- nvim-tree

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

autocmd({ "VimEnter" }, { callback = open_nvim_tree })
