local present, onedark = pcall(require, "onedark")

if not present then
  return
end

onedark.setup {
  style = "warmer",
}

onedark.load()

-- https://github.com/navarasu/onedark.nvim
