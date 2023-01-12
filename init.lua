require "custom.options"

vim.g.luasnippets_path = "custom.snippets"

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
  nested = true,
})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionLoadPost",
  callback = function()
    require("nvim-tree").toggle(false, true)
  end,
})

-- require "custom.linux"

require "custom.windows"
