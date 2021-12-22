local color = require('xresources')
local galaxyline = require('galaxyline')
local condition = require("galaxyline.condition")

local function get_vi_mode_color(mode)
    local mode_colors = {
        n = color.cyan,
        t = color.cyan,
    }
    local col = mode_colors[mode]
    if col == nil then col = color.fg end
    return col
end

local function get_vi_mode()
    local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c= 'COMMAND',
        V= 'VISUAL',
        [''] = 'VISUAL',
        v ='VISUAL',
        c  = 'COMMAND',
        ['r?'] = ':CONFIRM',
        rm = '--MORE',
        R  = 'REPLACE',
        Rv = 'VIRTUAL',
        s  = 'SELECT',
        S  = 'SELECT',
        ['r']  = 'HIT-ENTER',
        [''] = 'SELECT',
        t  = 'TERMINAL',
        ['!']  = 'SHELL',
    }
    local vim_mode = vim.fn.mode()
    local mode_color = get_vi_mode_color(vim_mode)
    vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color)
    return "  " .. alias[vim_mode] .. " "
end

galaxyline.section.left = {
    {
        ViMode = {
            provider = get_vi_mode,
            highlight = {color.purple,color.bg,'bold'},
            separator = '',
            separator_highlight = {color.cyan,color.bg},
        }
    },
    {
        Separator01 = {
            provider = function() return ' ' end,
            highlight = {color.cyan,color.blue},
        }
    },
    {
        FileIcon = {
            provider = 'FileIcon',
            condition = condition.buffer_not_empty,
            highlight = {color.fg,color.blue},
        }
    },
    {
        FileName = {
            provider = 'FileName',
            highlight = {color.fg,color.blue},
            separator = '',
            separator_highlight = {color.cyan,color.blue},
        }
    },
    {
        GitIcon = {
            provider = function() return '  ' end,
            condition = condition.check_git_workspace,
            highlight = {color.bg,color.cyan,'bold'},
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            highlight = {color.bg,color.cyan,'bold'},
        }
    },
    {
        LeftEnd = {
            provider = function() return '█' end,
            highlight = {color.cyan,color.bg},
        }
    }
}

galaxyline.section.right = {
    {
        RightEnd = {
            provider = function() return '' end,
            highlight = {color.black,color.bg},
        }
    },
    {
        LineColumn = {
            provider = 'LineColumn',
            highlight = {color.bg,color.black,'bold'},
            separator = '',
            separator_highlight = {color.black,color.black},
        }
    },
    {
        LinePercent = {
            provider = 'LinePercent',
            highlight = {color.bg,color.light_black,'bold'},
            separator = '',
            separator_highlight = {color.light_black,color.black},
        }
    }
}
