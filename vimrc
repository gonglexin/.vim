" vimrc
" author: gonglexin
"
" God like this
"
if has('nvim')
  runtime! python_setup.vim
endif

call plug#begin(expand('~/.vim/bundle/'))

" General settings
Plug 'tpope/vim-sensible'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'szw/vim-ctrlspace'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

" Moving
Plug 'Lokaltog/vim-easymotion'
" Plug 'christoomey/vim-tmux-navigator'

" Editing
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'

" Colorscheme
Plug 'molokai'
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/Zenburn'

" Programming
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'slim-template/vim-slim.git'
" Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim'
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'janko-m/vim-test'

" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" Git integration
Plug 'tpope/vim-fugitive'

" Tmux integration
Plug 'benmills/vimux'

" Other plugins
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'

call plug#end()
filetype plugin indent on

" General
let mapleader = ","
set nu
set background=dark
colo hybrid

nmap <leader>s :source $MYVIMRC<CR>
nmap <leader>e :e $MYVIMRC<CR>

set nowrap
set nobackup
set noswapfile

set hlsearch    " highlight matches
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

" Jump to the last know position in a file after opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" vim-ctrlspace
" set hidden
" hi CtrlSpaceSelected term=reverse ctermfg=187   guifg=#d7d7af ctermbg=23    guibg=#005f5f cterm=bold gui=bold
" hi CtrlSpaceNormal   term=NONE    ctermfg=244   guifg=#808080 ctermbg=232   guibg=#080808 cterm=NONE gui=NONE
" hi CtrlSpaceSearch   ctermfg=220  guifg=#ffd700 ctermbg=NONE  guibg=NONE    cterm=bold    gui=bold
" hi CtrlSpaceStatus   ctermfg=230  guifg=#ffffd7 ctermbg=234   guibg=#1c1c1c cterm=NONE    gui=NONE

" NERD Tree
imap <leader>n <esc>:NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>

" vimux
let g:VimuxPromptString = "=>"
let g:VimuxHeight = "30"
autocmd FileType ruby       map <Leader>rr :call VimuxRunCommand("clear; ruby -w " . bufname("%"))<CR>
autocmd FileType javascript map <Leader>rr :call VimuxRunCommand("clear; node " . bufname("%"))<CR>
autocmd FileType go         map <Leader>rr :call VimuxRunCommand("clear; go run " . bufname("%"))<CR>
autocmd FileType sh         map <Leader>rr :call VimuxRunCommand("clear;" . getline('.'))<CR>
autocmd FileType sh         nnoremap <leader>r 0y$:!clear; <C-R>"<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>
map <Leader>vz :VimuxZoomRunner<CR>

" vim-dispatch
" autocmd FileType ruby let b:dispatch = 'ruby -w %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType javascript let b:dispatch = 'node %'
" autocmd FileType go let b:dispatch = 'go run %'
" nnoremap <leader>r :Dispatch<CR>
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

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_fmt_command = "goimports"

" vim-test
" let test#strategy = "vimux"
let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" rubocop
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

"" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Unite
nnoremap <leader>x :Unite file_rec/async<CR>
nnoremap <silent> <leader><space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> <leader>f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <space>/ :Unite grep:.<CR>
nnoremap <leader>b :Unite -quick-match buffer<CR>
nnoremap <silent> <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
elseif executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" Zoom / Restore window
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    exec t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>
