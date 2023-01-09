vim.notify = require("notify")


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


