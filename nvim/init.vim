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
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Plugins Config
" ================================
"
let NERDTreeQuitOnOpen=1
let mapleader=" "

nmap <leader>s <Plug>(easymotion-s2)
nmap <leader>nt :NERDTreeFind<CR>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
