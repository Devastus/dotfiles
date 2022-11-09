vim.cmd [[autocmd InsertEnter * :setlocal nohlsearch]]
vim.cmd [[autocmd InsertLeave * :setlocal hlsearch]]
vim.cmd [[autocmd WinEnter * setlocal cursorline]]
vim.cmd [[autocmd WinLeave * setlocal nocursorline]]
vim.cmd [[au BufWritePre * :%s/\s\+$//e]] -- Remove trailing whitespace upon saving
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- Do not autocomment new lines

-- Netrw config & keybinds through autocommands
vim.cmd [[au FileType netrw setl bufhidden=wipe]]
vim.cmd [[au FileType netrw nmap <buffer> h -]]
vim.cmd [[au FileType netrw nmap <buffer> <left> -]]
vim.cmd [[au FileType netrw nmap <buffer> l <CR>]]
vim.cmd [[au FileType netrw nmap <buffer> <right> <CR>]]
vim.cmd [[au FileType netrw nmap <buffer> qq :bw<CR>]]
vim.cmd [[au FileType netrw nmap <buffer> <Esc> :bw<CR>]]

-- Nim-specific
vim.cmd [[au FileType nim setlocal commentstring=#\ %s]]
