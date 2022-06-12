" Main
" ===============================
"
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber

set laststatus=2
set noshowmode


" Plugins
" ================================
"
call plug#begin()

" Navigation
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Plugins Config
" ================================
"

let g:coc_global_extensions = [ 'coc-tsserver' ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:airline_powerline_font = 1

let NERDTreeQuitOnOpen=1
let mapleader=" "

nmap <leader>gs :CocSearch
nmap <leader>nt :NERDTreeFind<CR>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

:imap ii <Esc>
