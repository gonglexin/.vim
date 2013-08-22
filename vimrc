" vimrc
" author: gonglexin
"
" God like this
"

set nocompatible
filetype off

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
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'garbas/vim-snipmate'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/vim-snippets'
Bundle 'ap/vim-css-color'
Bundle 'scrooloose/syntastic'

" Git integration
Bundle 'tpope/vim-fugitive'

" Bundle others
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'

" General
set shell=bash " let vim load the rbenv ruby path first (don't kown the reason)
nmap ,s :source ~/.vimrc<CR>
nmap ,e :e ~/.vimrc<CR>

let mapleader = ","
let maplocalleader = "\\"
set nu

colorscheme hybrid
filetype plugin indent on      " Automatically detect file types.
syntax enable

set nowrap
set nobackup
set noswapfile
set hlsearch
set encoding=utf-8
"set shortmess=atI
set backspace=indent,eol,start

" List chars
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set cursorline

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

" NERD Tree
imap <silent> <F2> <esc>:NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>

"let g:airline_powerline_fonts=1
let g:airline_left_sep=""
let g:airline_left_alt_sep=""
let g:airline_right_sep=""
let g:airline_right_alt_sep=""

" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
endif
