local actions = require("lir.actions")
local mark_actions = require("lir.mark.actions")
local clipboard_actions = require("lir.clipboard.actions")
local color = require("palette").color

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lir").setup({
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['m']     = actions.mkdir,
    ['n']     = actions.newfile,
    ['r']     = actions.rename,
    ['@']     = actions.cd,
    ['y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['d']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['c'] = clipboard_actions.copy,
    ['x'] = clipboard_actions.cut,
    ['p'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.4)
      local height = math.floor(vim.o.lines * 0.6)
      return {
        border = {
          "╭", "─", "╮", "│", "╯", "─", "╰", "│",
        },
        width = width,
        height = height,
        row = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
      }
    end,
  },
  hide_cursor = true,
  on_init = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )

    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end,
})

require("lir.git_status").setup({
  show_ignored = false
})

nmap("<Leader>f", ":lua require'lir.float'.toggle()<CR>");

highlight("LirFloatBorder", "none", color.fg, "none")

-- custom folder icon
-- require("nvim-web-devicons").set_icon({
--   lir_folder_icon = {
--     icon = "",
--     color = "#7ebae4",
--     name = "LirFolderNode"
--   }
-- })
