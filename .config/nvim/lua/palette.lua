local theme_style = "warmer"
local theme_palette = require("onedark.palette")

local palette = {
    style = theme_style,
    color = theme_palette[theme_style]
}
palette.color["white"] = "#ffffff"

return palette
