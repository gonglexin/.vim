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

" Moving
Plugin 'Lokaltog/vim-easymotion'

" Editing
" Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

" Colorscheme
Plugin 'molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'chriskempson/base16-vim'

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
Plugin 'hwartig/vim-seeing-is-believing'

" Git integration
Plugin 'tpope/vim-fugitive'

" Plugin others
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrates UltiSnips tab completion with YouCompleteMe
" See: https://github.com/Valloric/YouCompleteMe/issues/36
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ["snips"]
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

" Enable, when the first time in insert mode.
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:airline_powerline_fonts=1
let g:airline_left_sep=""
let g:airline_left_alt_sep=""
let g:airline_right_sep=""
let g:airline_right_alt_sep=""

" Dispatch mapping
" TODO: make it working in macvim
autocmd FileType ruby let b:dispatch = 'ruby -w %'
autocmd FileType javascript let b:dispatch = 'node %'
" nnoremap <leader>r :Dispatch<CR>

" let g:syntastic_ruby_checkers = ['rubocop', 'mri']

nmap <buffer> <leader>r <Plug>(seeing-is-believing-run)
xmap <buffer> <leader>r <Plug>(seeing-is-believing-run)
imap <buffer> <leader>r <Plug>(seeing-is-believing-run)

nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
