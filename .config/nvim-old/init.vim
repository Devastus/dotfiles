
""""""""""""""""""""""""""""""""""""""""""""
""" PLUGINS (vim-plug)
""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $RC
endif

let g:polyglot_disabled = ['java']

call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'thezeroalpha/vim-lf'
Plug 'rbgrouleff/bclose.vim'
Plug 'mattn/webapi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ericcurtin/CurtineIncSw.vim'
" Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'diepm/vim-rest-console'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'L3MON4D3/LuaSnip'
Plug 'Pocco81/AutoSave.nvim'
Plug 'nekonako/xresources-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

call plug#end()

" Don't let Git Gutter map keys
let g:gitgutter_map_keys = 0

" lf filemanager
let g:lf_replace_netrw = 1

" Vimspector
" let g:vimspector_enable_mappings = 'HUMAN'

" Rust
" let g:rustfmt_autosave = 1
au BufRead,BufNewFile *.rs set filetype=rust

" Nim
autocmd FileType nim setlocal commentstring=#\ %s

""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL
""""""""""""""""""""""""""""""""""""""""""""

syntax on
set nocompatible
set encoding=utf8
filetype plugin indent on
set backspace=indent,eol,start
set hidden
set noswapfile
set bufhidden="delete"
set nobackup
set nowritebackup
set clipboard=unnamedplus
" set virtualedit=all
set mouse=a

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
set path=.,**

" set wildmenu
" set wildmode=longest:list,full
" set wildignore+=**/node_modules/**,**/dist/**,**_site/**,**/bin/**,**/target/**,**/.git/**,**/.vs/**,**/.vscode/**,**/.cargo/**
" set wildignore+=*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map,*.exe,*.so,*.dll,*.obj,*.o

" Strip trailing whitespace from all the files
autocmd BufWritePre * %s/\s\+$//e
" Automatically remove preview window after auto-completion
autocmd CompleteDone * pclose
" Auto-read when changing buffer
au FocusGained,BufEnter * :checktime

""""""""""""""""""""""""""""""""""""""""""""
""" VISUALS
""""""""""""""""""""""""""""""""""""""""""""

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
set t_Co=256
set number
set ruler
set showcmd
set splitright
set splitbelow
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab autoindent smartindent
set background=dark
set incsearch hlsearch
set shortmess+=c
set cmdheight=1
set laststatus=2
set updatetime=300
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" Make sure italics are supported
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Theme (from .Xresources)

colorscheme xresources

""""""""""""""""""""""""""""""""""""""""""""
""" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""
""" KEYBINDS
""""""""""""""""""""""""""""""""""""""""""""

" Remap Leader to Space
nnoremap <Space> <NOP>
let mapleader="\<Space>"

" unmap ^X@s
noremap ^X@sq <NOP>

" Leader mappings
nnoremap <leader>of :LF %:p edit<CR>
nnoremap <leader>ow :LF :pwd edit<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <Leader>rb :silent make <bar> redraw!<CR>
map <silent> <Leader>r+ :vertical resize +5<CR>
map <silent> <Leader>r- :vertical resize -5<CR>
map <Leader>tb :Tabularize /

" CurtineIncSw (switch between .c and .h files)
nmap <Leader>th :call CurtineIncSw()<CR>

" Nvim LSP keybinds
" nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gd         <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <leader>dd <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> gy       <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> <leader>qf <cmd>lua vim.lsp.buf.code_action()<CR>

" Open LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

" Clear screen, including search highlights
nnoremap <C-l> :nohlsearch<CR><C-l>

" Start and end of line
nnoremap H ^
nnoremap L $

" Close INSERT mode
inoremap <C-j><C-k> <Esc>

" Move and indent lines of text
nnoremap <S-j> :m+<CR>==
nnoremap <S-k> :m-2<CR>==
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <S-j> :m'>+<CR>gv=gv
vnoremap <S-k> :m-2<CR>gv=gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

lua <<EOF
require("lsp")
require("statusbar")
require("completion")
require("autopairs")
EOF
