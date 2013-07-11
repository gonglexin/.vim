" vimrc
" author: gonglexin
"
" God like this
"

set nocompatible
filetype off

" let Vundle manage bundle
" required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" Moving
Bundle 'Lokaltog/vim-easymotion'

" Editing
Bundle 'ervandew/supertab'

" Colorscheme
Bundle 'molokai'
Bundle 'w0ng/vim-hybrid'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'altercation/vim-colors-solarized'

" Programming
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" Git integration
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" Bundle others
Bundle 'Lokaltog/vim-powerline'

" General
nmap ,s :source ~/.vimrc<CR>
nmap ,e :e ~/.vimrc<CR>

let mapleader = ","
let maplocalleader = "\\"
set nu

colorscheme hybrid
filetype plugin indent on      " Automatically detect file types.
syntax enable

set nowrap
set ts=2
set nobackup
set noswapfile
set hlsearch
set shortmess=atI

" NERD Tree
imap <silent> <F2> <esc>:NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>

" PowerLine
set laststatus=2
let g:Powerline_symbols = 'fancy'
