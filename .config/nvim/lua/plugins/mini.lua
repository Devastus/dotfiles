--local color = require("xresources")
local color = require("palette").color

require("mini.comment").setup({})
require("mini.completion").setup({})
require("mini.cursorword").setup({ delay = 300 })
require("mini.pairs").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})

highlight("MiniTablineCurrent", "bold", color.white, color.blue)
highlight("MiniTablineVisible", "none", color.blue, color.bg_d)
highlight("MiniTablineHidden", "none", color.blue, color.bg_d)
highlight("MiniTablineModifiedCurrent", "bold", color.white, color.blue)
highlight("MiniTablineModifiedVisible", "none", color.blue, color.bg_d)
highlight("MiniTablineModifiedHidden", "none", color.blue, color.bg_d)
highlight("MiniTablineFill", "none", color.blue, color.bg_d)
