" vimrc
" author: gonglexin
"
" God like this
"
if has('nvim')
  runtime! python_setup.vim
endif

call plug#begin(expand('~/.vim/plugged/'))

" General settings
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

" Moving
Plug 'easymotion/vim-easymotion'

" Editing
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/Zenburn'
Plug 'arcticicestudio/nord-vim'

" Programming
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-css-color'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" DB
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/quickpick.vim'
Plug 'prabirshrestha/quickpick-lsp.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-which-key'

" Snippet
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kitagry/vs-snippets'

" Git integration
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" Tmux integration
Plug 'benmills/vimux'

" Other plugins
Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on

" General
let mapleader = ","
set nu
set background=dark
colo nord

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

""{ fzf
map <leader>f  :Clap files<CR>
map <leader>g  :Clap git_files<CR>
map <leader>ag :Clap grep2<CR>
map <leader>b  :Clap buffers<CR>
map <leader>c  :Clap commits<CR>
map <leader>bc :Clap bcommits<CR>
map <leader>cm :Clap command<CR>
map <leader>ch :Clap command_history<CR>
map <leader>j  :Clap jumps<CR>
""}

""{ lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
""}

""{ Ctrl-P
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
""}

""{ vim-which-key
nnoremap <silent> <leader> :WhichKey ','<CR>
""}

""{ NERD Tree
imap <leader>n <esc>:NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>
""}

""{ LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
    map <leader>gw :PLspWorkspaceSymbol<cr>
    map <leader>gs :PLspDocumentSymbol<cr>
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_diagnostics_float_cursor = 1
""}

""{ asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
""}

""{ vim-vsnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
""}

""{ markdown
autocmd FileType markdown   map <Leader>pr <Plug>MarkdownPreview
autocmd FileType markdown   map <Leader>ps <Plug>MarkdownPreviewStop
autocmd FileType markdown   map <Leader>pt <Plug>MarkdownPreviewToggle
""}

""{ vimux
let g:VimuxPromptString = "=>"
let g:VimuxHeight = "30"
autocmd FileType ruby       map <Leader>vr :call VimuxRunCommand("clear; ruby -w " . bufname("%"))<CR>
autocmd FileType javascript map <Leader>vr :call VimuxRunCommand("clear; node " . bufname("%"))<CR>
autocmd FileType go         map <Leader>vr :call VimuxRunCommand("clear; go run " . bufname("%"))<CR>
autocmd FileType sh         map <Leader>vr :call VimuxRunCommand("clear;" . getline('.'))<CR>
autocmd FileType sh         nnoremap <leader>r 0y$:!clear; <C-R>"<CR>
""}

" " Elixir {{{
" "
" " Treat mix.lock file as Elixir code
" autocmd BufNewFile,BufRead mix.lock setlocal filetype=elixir
" autocmd Filetype elixir nnoremap <buffer> <Leader>r :!elixir %<cr>
" autocmd Filetype elixir nnoremap <buffer> <Leader>k :!mix test %<cr>
" autocmd Filetype elixir nnoremap <buffer> <Leader>K :execute "!mix test --only line:" . line(".") . " %"<cr>
" autocmd Filetype elixir nnoremap <buffer> <Leader>vr :call VimuxRunCommand("clear; elixir " .  bufname("%"))<cr>
" autocmd Filetype elixir nnoremap <buffer> <Leader>vk :call VimuxRunCommand("clear; mix test " . bufname("%"))<cr>
" autocmd Filetype elixir nnoremap <buffer> <Leader>vK :call VimuxRunCommand("clear; mix test --only line:" . line(".") . " " .  bufname("%"))<cr>
" " }}}
"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>
map <Leader>vz :VimuxZoomRunner<CR>

""{ vim-dispatch
" autocmd FileType ruby let b:dispatch = 'ruby -w %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType javascript let b:dispatch = 'node %'
" autocmd FileType go let b:dispatch = 'go run %'
" nnoremap <leader>r :Dispatch<CR>
nnoremap <leader>v :Copen<CR>
""}

" " vim-ruby
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1

""{ vim-test
let test#strategy = "vimux"
" let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>
""}

""{ vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
""}

""{ Zoom / Restore window
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
""}
