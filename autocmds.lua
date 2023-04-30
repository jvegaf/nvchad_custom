local augroup = vim.api.nvim_create_augroup
local autocmds = vim.api.nvim_create_autocmd


augroup("discontinue_comments", { clear = true })

autocmds({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o"
  end,
  group = "discontinue_comments",
  desc = "Dont't continue comments with o/O",
})

augroup("lsp_attach_auto_diag", { clear = true })

autocmds("LspAttach", {
  group = "lsp_attach_auto_diag",
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    -- create the autocmd to show diagnostics
    autocmds("CursorHold", {
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
autocmds("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

