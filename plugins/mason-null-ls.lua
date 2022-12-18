local present, mas = pcall(require, "mason-null-ls")

if not present then
  return
end

mas.setup {
  ensure_installed = {
    "eslint_d",
    "prettierd",
    "luacheck",
    "stylua",
    "shfmt",
    "shellcheck",
  },
}
