-------------------------------------------------------------------------------
-- Utilities
-------------------------------------------------------------------------------

local H = {}

function H.get_highlighted(hl, item)
    return string.format("%%#%s#%s", hl, item)
end

function H.get_filetype_icon(file_name, file_ext)
  -- Have this `require()` here to not depend on plugin initialization order
  local has_devicons, devicons = pcall(require, "nvim-web-devicons")
  if not has_devicons then
    return ""
  end

  local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
  return devicons.get_icon(file_name, file_ext, { default = true })
end

-------------------------------------------------------------------------------
-- Section definitions
-------------------------------------------------------------------------------

local mode_map = {
    ["n"] = " NORMAL ",
    ["no"] = " N-OP ",
    ["v"] = " VISUAL ",
    ["V"] = " V-LINE ",
    [""] = " V-BLOCK ",
    ["s"] = " SELECT ",
    ["S"] = " S-LINE ",
    [""] = " S-BLOCK ",
    ["i"] = " INSERT ",
    ["R"] = " REPLACE ",
    ["Rv"] = " V-REPLACE ",
    ["c"] = " COMMAND ",
    ["cv"] = " VIM EX ",
    ["ce"] = " EX ",
    ["r"] = " PROMPT ",
    ["rm"] = " MORE ",
    ["r?"] = " CONFIRM ",
    ["!"] = " SHELL ",
    ["t"] = " TERMINAL "
}

local sections = {
    mode = function(mode, mode_map, color_map)
        local c = color_map[mode] or color_map["i"]
        highlight("StatuslineMode", "bold", c[1], c[2])
        return H.get_highlighted("StatuslineMode", mode_map[mode] or mode)
    end,

    filetype = function(hl, filetype)
        if filetype == "" then
            return ""
        end

        local icon = H.get_filetype_icon(file_name, file_ext)
        if icon ~= "" then
            filetype = string.format(" %s %s ", icon, filetype):lower()
        end

        return H.get_highlighted(hl, filetype)
    end,

    filename = function(hl, filetype)
        return filetype ~= ""
            and H.get_highlighted(hl, "%<%f ")
            or ""
    end,

    git = function(hl)
        local signs = vim.b.gitsigns_status_dict or { head = "", added = 0, changed = 0, removed = 0 }
        return signs.head ~= ""
               and H.get_highlighted(hl, string.format(" +%s ~%s -%s |  %s ", signs.added, signs.changed, signs.removed, signs.head))
               or ""
    end,

    location = function(hl)
        return H.get_highlighted(hl, " %l:%c [%p%%] ")
    end,

    separator = function(hl)
        return H.get_highlighted(hl, "%=")
    end
}

-------------------------------------------------------------------------------
-- Assign colors & highlights
-------------------------------------------------------------------------------

local color = require("xresources")

local c_none = "none"
local color_map = {
    ["n"] = { color.black, color.blue },
    ["v"] = { color.light_white, color.purple },
    ["V"] = { color.light_white, color.purple },
    [""] = { color.light_white, color.purple },
    ["i"] = { color.light_white, color.red },
    ["c"] = { color.light_white, color.light_purple },
}

highlight("StatuslineFile", "none", color.white, color.black)
highlight("StatuslineFiletype", "bold", color.blue, color.black)
highlight("StatuslineGit", "bold", color.blue, color.black)
highlight("StatuslineLocation", "none", color.white, color.black)
highlight("StatuslineSeparator", "none", c_none, color.black)
highlight("StatuslineBlank", "none", c_none, c_none)

-------------------------------------------------------------------------------
-- Draw statusline
-------------------------------------------------------------------------------

function statusline_draw()
    local m = vim.api.nvim_get_mode().mode
    local ft = vim.bo.filetype

    return table.concat({
        sections.mode(m, mode_map, color_map),
        sections.filetype("StatuslineFiletype", ft),
        sections.filename("StatuslineFile", ft),
        sections.separator("StatuslineSeparator"),
        sections.git("StatuslineGit"),
        sections.location("StatuslineLocation"),
    })
end

function statusline_blank()
    return sections.separator("StatuslineSeparator")
end

exec([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.statusline_draw()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.statusline_blank()
    augroup END
]], false)
