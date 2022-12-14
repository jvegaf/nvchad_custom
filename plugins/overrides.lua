local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
    "cpp",
  },
}

M.mason = {
  ensure_installed = {
    "prettierd",
    "html-lsp",
    "eslint_d",
    "emmet-ls",
    "eslint-lsp",
    "angular-language-server",
    "arduino-language-server",
    "bash-language-server",
    "clangd",
    "css-lsp",
    "lua-language-server",
    "shellcheck",
    "shfmt",
    "stylua",
    "typescript-language-server",
  },
}

return M
