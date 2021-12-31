-------------------------------------------------------------
-- ALIASES
-------------------------------------------------------------

HOME = os.getenv("HOME")

cmd = vim.cmd
opt = vim.opt
exec = vim.api.nvim_exec
fn = vim.fn
g = vim.g

function map(mode, shortcut, command, silent)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = silent or true })
end

function nmap(shortcut, command, silent)
  map('n', shortcut, command)
end

function imap(shortcut, command, silent)
  map('i', shortcut, command)
end

function vmap(shortcut, command, silent)
  map('v', shortcut, command)
end

function cmap(shortcut, command, silent)
  map('c', shortcut, command)
end

function tmap(shortcut, command, silent)
  map('t', shortcut, command)
end

function highlight(group, style, fg, bg)
    cmd("highlight " .. group .. " gui=" .. style .. " guifg=" .. fg .. " guibg=" .. bg)
end
