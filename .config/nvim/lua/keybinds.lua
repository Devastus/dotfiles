nmap("<Space>", "<NOP>")
vim.g.mapleader = " "

-- Move to start and end of lines
nmap("H", "^")
nmap("L", "$")
vmap("H", "^")
vmap("L", "$")

-- Buffer hotkeys
nmap("<C-p>", ":bprev<CR>")
nmap("<C-n>", ":bnext<CR>")
nmap("<C-q>", ":bwipeout<CR>")

-- Close INSERT mode
imap("<C-j><C-k>", "<Esc>")

-- Move and indent lines of text
nmap("<S-j>", ":m+<CR>==")
nmap("<S-k>", ":m-2<CR>==")
nmap("<Tab>", ">>")
nmap("<S-Tab>", "<<")
vmap("<S-j>", ":m'>+<CR>gv=gv")
vmap("<S-k>", ":m-2<CR>gv=gv")
vmap("<Tab>", ">gv")
vmap("<S-Tab>", "<gv")

nmap("<leader>f", ":Explore<CR>")