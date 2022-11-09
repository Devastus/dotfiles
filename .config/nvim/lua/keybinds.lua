local vim = vim

vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<NOP>", {noremap = true, silent = true})

-- Open netrw
vim.keymap.set("n", "<leader>f", ":Ex<cr>", {noremap = true, silent = true})

-- Move to start and end of lines
vim.keymap.set("n", "H", "^", {noremap = true, silent = true})
vim.keymap.set("n", "L", "$", {noremap = true, silent = true})
vim.keymap.set("v", "H", "^", {noremap = true, silent = true})
vim.keymap.set("v", "L", "$", {noremap = true, silent = true})

-- Buffer hotkeys
vim.keymap.set("n", "<C-p>", ":bprev<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-n>", ":bnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-q>", ":bwipeout<CR>", {noremap = true, silent = true})

-- Close INSERT mode
vim.keymap.set("i", "<C-j><C-k>", "<Esc>", {noremap = true, silent = true})

-- Move and indent lines of text
vim.keymap.set("n", "<S-j>", ":m+<CR>==", {noremap = true, silent = true})
vim.keymap.set("n", "<S-k>", ":m-2<CR>==", {noremap = true, silent = true})
vim.keymap.set("n", "<Tab>", ">>", {noremap = true, silent = true})
vim.keymap.set("n", "<S-Tab>", "<<", {noremap = true, silent = true})
vim.keymap.set("v", "<S-j>", ":m'>+<CR>gv=gv", {noremap = true, silent = true})
vim.keymap.set("v", "<S-k>", ":m-2<CR>gv=gv", {noremap = true, silent = true})
vim.keymap.set("v", "<Tab>", ">gv", {noremap = true, silent = true})
vim.keymap.set("v", "<S-Tab>", "<gv", {noremap = true, silent = true})

-- Remap Vim default replace-edit to not put to yank register
vim.keymap.set("n", "c", "\"_c", {noremap = true, silent = true})
vim.keymap.set("v", "c", "\"_c", {noremap = true, silent = true})

vim.keymap.set('x', '<leader>aa', function() require'align'.align_to_char(1, true)             end, {noremap = true, silent = true})
vim.keymap.set('x', '<leader>as', function() require'align'.align_to_char(2, true, true)       end, {noremap = true, silent = true})
vim.keymap.set('x', '<leader>aw', function() require'align'.align_to_string(false, true, true) end, {noremap = true, silent = true})
vim.keymap.set('x', '<leader>ar', function() require'align'.align_to_string(true, true, true)  end, {noremap = true, silent = true})
