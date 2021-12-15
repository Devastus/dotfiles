local color = require('xresources')
local galaxyline = require('galaxyline')
local condition = require("galaxyline.condition")

local function get_vi_mode_color(mode)
    local mode_colors = {
        n = color.cyan,
        t = color.cyan,
    }
    local col = mode_colors[mode]
    if col == nil then col = color.white end
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
            separator_highlight = {color.blue,color.bg},
        }
    },
    {
        Separator01 = {
            provider = function() return '' end,
            highlight = {color.blue,color.purple},
        }
    },
    {
        FileIcon = {
            provider = 'FileIcon',
            condition = condition.buffer_not_empty,
            highlight = {color.bg,color.purple},
        }
    },
    {
        FileName = {
            provider = 'FileName',
            highlight = {color.bg,color.purple},
            separator = '',
            separator_highlight = {color.blue,color.purple},
        }
    },
    {
        GitIcon = {
            provider = function() return '  ' end,
            condition = condition.check_git_workspace,
            highlight = {color.bg,color.blue,'bold'},
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            highlight = {color.bg,color.blue,'bold'},
        }
    },
    {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = condition.check_git_workspace,
            icon = '  ',
            highlight = {color.bg,color.blue,'bold'},
        }
    },
    {
        DiffModified = {
            provider = 'DiffModified',
            condition = condition.check_git_workspace,
            icon = ' ',
            highlight = {color.bg,color.blue,'bold'},
        }
    },
    {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = condition.check_git_workspace,
            icon = ' ',
            highlight = {color.bg,color.blue,'bold'},
        }
    },
    {
        LeftEnd = {
            provider = function() return '' end,
            highlight = {color.blue,color.bg},
        }
    }
}

galaxyline.section.right = {
    {
        RightEnd = {
            provider = function() return '' end,
            highlight = {color.blue,color.bg},
        }
    },
    {
        LineColumn = {
            provider = 'LineColumn',
            highlight = {color.bg,color.purple,'bold'},
            separator = '',
            separator_highlight = {color.blue,color.purple},
        }
    },
    {
        LinePercent = {
            provider = 'LinePercent',
            highlight = {color.bg,color.cyan,'bold'},
            separator = '',
            separator_highlight = {color.cyan,color.purple},
        }
    }
}
