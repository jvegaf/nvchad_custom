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
    "arduino",
    "java",
    "json",
    "javascript",
    "yaml"
  },
}

M.mason = {
  ensure_installed = {
    "typescript-language-server",
    "prettierd",
    "html-lsp",
    "eslint_d",
    "emmet-ls",
    "css-lsp",
    "eslint-lsp",
    "angular-language-server",
    "json-lsp",
    "arduino-language-server",
    "bash-language-server",
    "clangd",
    "clang-format",
    "lua-language-server",
    "shellcheck",
    "shfmt",
    "stylua",
    "yamllint",
    "yaml-language-server",
    "yamlfmt",
    "php-debug-adapter",
    "intelephense",
    "jdtls",
    "java-debug-adapter",
    "dockerfile-language-server",
  },
}

return M
