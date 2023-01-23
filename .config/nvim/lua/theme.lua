vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.g.t_Co = 0

vim.o.cursorline = true
vim.wo.cursorline = true

local theme = require("xresources").setup()

-- local theme = require("tokyonight")
-- theme.setup({style = "moon"})
-- theme.load()
