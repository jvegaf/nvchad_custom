local opt = vim.opt

opt.relativenumber = true
opt.conceallevel = 2
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.linebreak = true -- linebreak soft wrap at word
opt.list = true -- sow whitespace character
opt.listchars = { tab = " ", extends = "⟩", precedes = "⟨", trail = "·", eol = "﬋" }
opt.showbreak = "﬌ "
opt.cmdheight = 1

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_lin = has "linux"

if is_win then
  require "custom.windows"
end

if is_lin then
  require "custom.linux"
end
