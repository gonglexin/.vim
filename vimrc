" vimrc
" author: gonglexin
"
" God like this
"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'szw/vim-ctrlspace'

" Moving
Plugin 'Lokaltog/vim-easymotion'

" Editing
Plugin 'ervandew/supertab'

" Colorscheme
Plugin 'molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Programming
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ap/vim-css-color'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'

" Git integration
Plugin 'tpope/vim-fugitive'

" Tmux integration
Plugin 'benmills/vimux'

" Other plugins
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on      " Automatically detect file types.

" General
set t_Co=256
set shell=bash " let vim load the rbenv ruby path first (don't kown the reason)
nmap ,s :source $MYVIMRC<CR>
nmap ,e :e $MYVIMRC<CR>

let mapleader = ","
let maplocalleader = "\\"
set nu

colorscheme Tomorrow-Night-Eighties
syntax enable

set nowrap
set nobackup
set noswapfile
set encoding=utf-8
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

" Jump to the last know position in a file after opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" vim-ctrlspace
set hidden
hi CtrlSpaceSelected term=reverse ctermfg=187   guifg=#d7d7af ctermbg=23    guibg=#005f5f cterm=bold gui=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244   guifg=#808080 ctermbg=232   guibg=#080808 cterm=NONE gui=NONE
hi CtrlSpaceSearch   ctermfg=220  guifg=#ffd700 ctermbg=NONE  guibg=NONE    cterm=bold    gui=bold
hi CtrlSpaceStatus   ctermfg=230  guifg=#ffffd7 ctermbg=234   guibg=#1c1c1c cterm=NONE    gui=NONE

" NERD Tree
imap <leader>n <esc>:NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>

" vimux
let g:VimuxPromptString = "=>"
let g:VimuxHeight = "30"
map <Leader>rb :call VimuxRunCommand("clear; ruby -w " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>
map <Leader>vz :VimuxZoomRunner<CR>

" vim-dispatch
autocmd FileType ruby let b:dispatch = 'ruby -w %'
autocmd FileType javascript let b:dispatch = 'node %'
nnoremap <leader>r :Dispatch<CR>
nnoremap <leader>v :Copen<CR>

" vim-airline
" let g:airline_powerline_fonts=1
let g:airline_exclude_preview = 1 " hacking vim-ctrlspace
let g:airline_left_sep=""
let g:airline_left_alt_sep=""
let g:airline_right_sep=""
let g:airline_right_alt_sep=""

" vim-ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1
