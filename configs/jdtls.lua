local status = pcall(require, "jdtls")
if not status then
  return
end

local home = os.getenv("HOME")

local dataFolder = home .. "/.local/share/nvim"

local config = {
  -- cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
  cmd = {
    "bash",
    home .. "/.config/nvim/custom/java-lsp.bash",
    dataFolder,
    "java",
  },
  root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
