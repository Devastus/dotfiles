local color = require("xresources")

require("mini.comment").setup({})
require("mini.completion").setup({})
require("mini.cursorword").setup({ delay = 300 })
require("mini.pairs").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})

highlight("MiniTablineCurrent", "bold", color.light_white, color.light_cyan)
highlight("MiniTablineVisible", "none", color.blue, color.black)
highlight("MiniTablineHidden", "none", color.blue, color.black)
highlight("MiniTablineModifiedCurrent", "bold", color.light_white, color.light_cyan)
highlight("MiniTablineModifiedVisible", "none", color.blue, color.black)
highlight("MiniTablineModifiedHidden", "none", color.blue, color.black)
highlight("MiniTablineFill", "none", color.blue, color.black)