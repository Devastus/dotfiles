
""""""""""""""""""""""""""""""""""""""""""""
""" PLUGINS (vim-plug)
""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $RC
endif

call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'itchyny/lightline.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sainnhe/edge'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'pechorin/any-jump.vim'
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mattn/webapi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ericcurtin/CurtineIncSw.vim'
" Plug 'puremourning/vimspector'
Plug 'diepm/vim-rest-console'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'mfussenegger/nvim-dap'

call plug#end()

" Neovim LSP configuration
:lua require('lspconf')
set completeopt-=preview
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1

" Don't let Git Gutter map keys
let g:gitgutter_map_keys = 0

" lf filemanager
let g:lf_replace_netrw = 1

" Vimspector
" let g:vimspector_enable_mappings = 'HUMAN'

" Rust
" let g:rustfmt_autosave = 1
au BufRead,BufNewFile *.rs set filetype=rust

""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL
""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf8
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set hidden
set noswapfile
set bufhidden="delete"
set nobackup
set nowritebackup
set clipboard=unnamedplus
set mouse=a

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
set path=.,**

set wildmenu
set wildmode=longest:list,full
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,**/bin/**,**/target/**,**/.git/**,**/.vs/**,**/.vscode/**,**/.cargo/**
set wildignore+=*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map,*.exe,*.so,*.dll,*.obj,*.o

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

" Theme

" let g:material_theme_style = 'palenight'
" let g:lightline = { 'colorscheme': 'material_vim' }
" colorscheme material

" Make sure italics are supported
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:edge_style = 'aura'
let g:edge_enable_italic = 0
let g:disable_italic_comment = 1
let g:lightline = { 'colorscheme': 'edge' }
colorscheme edge

" let g:lightline = { 'colorscheme': 'onehalfdark' }
" colorscheme onehalfdark

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
nnoremap <leader>f :LfCurrentFile<CR>
nnoremap <leader>of :LfCurrentFile<CR>
nnoremap <leader>ow :LfWorkingDirectory<CR>
nnoremap <Leader>rb :silent make <bar> redraw!<CR>
map <silent> <Leader>r+ :vertical resize +5<CR>
map <silent> <Leader>r- :vertical resize -5<CR>

" CurtineIncSw (switch between .c and .h files)
nmap <Leader>th :call CurtineIncSw()<CR>

" Nvim LSP keybinds
" nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>dd <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>qf <cmd>lua vim.lsp.buf.code_action()<CR>

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
