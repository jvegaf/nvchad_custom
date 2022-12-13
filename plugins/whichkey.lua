local present, wk = pcall(require, "which-key")

if not present then
  return
end

wk.register({
  a = { name = "Application" },
  c = { name = "LSP" },
  f = { name = "Find" },
  g = { name = "Git" },
  l = { name = "Telescope" },
  p = { name = "Picker" },
  t = { name = "Terminal" },
  u = { name = "Update" },
  w = { name = "Workspace" },
}, { prefix = "<leader>" })
