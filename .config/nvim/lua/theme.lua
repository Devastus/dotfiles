local palette = require("palette")
local theme = require("onedark")
theme.setup {
    style = palette.style
}
theme.load()

opt.background = "dark"
opt.number = true
opt.ruler = true
opt.showcmd = true
opt.showmatch = true
opt.termguicolors = true
opt.incsearch = true
opt.cmdheight = 1
opt.laststatus = 2

cmd [[autocmd InsertEnter * :setlocal nohlsearch]]
cmd [[autocmd InsertLeave * :setlocal hlsearch]]
cmd [[autocmd WinEnter * setlocal cursorline]]
cmd [[autocmd WinLeave * setlocal nocursorline]]
