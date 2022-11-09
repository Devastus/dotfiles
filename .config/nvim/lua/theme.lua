vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

local theme = require("tokyonight")
theme.setup({style = "moon"})
theme.load()
