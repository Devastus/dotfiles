local vim = vim

vim.opt.guicursor = ""
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.bufhidden = "delete"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Performance
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 240
