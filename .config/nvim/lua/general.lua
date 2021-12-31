-------------------------------------------------------------
-- GENERAL
-------------------------------------------------------------

opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
opt.swapfile = false
opt.bufhidden = "delete"
opt.backup = false
opt.writebackup = false
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.path = { ".", "**" }
opt.wildmenu = true
opt.wildmode = "longest:list,full"
opt.updatetime = 300
opt.splitright = true
opt.splitbelow = true

-------------------------------------------------------------
-- TABS & INDENT
-------------------------------------------------------------

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-------------------------------------------------------------
-- PERFORMANCE
-------------------------------------------------------------

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

-------------------------------------------------------------
-- AUTO-COMMANDS
-------------------------------------------------------------

cmd [[au BufWritePre * :%s/\s\+$//e]] -- Remove trailing whitespace upon saving
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- Do not autocomment new lines
