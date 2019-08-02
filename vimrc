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

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

" Moving
Plug 'Lokaltog/vim-easymotion'

" Editing
Plug 'junegunn/vim-easy-align'

" Colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/Zenburn'

" Programming
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" Git integration
Plug 'tpope/vim-fugitive'

" Tmux integration
Plug 'benmills/vimux'

" Other plugins
Plug 'itchyny/lightline.vim'
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

" Ctrl-P
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" NERD Tree
imap <leader>n <esc>:NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>

" vimux
let g:VimuxPromptString = "=>"
let g:VimuxHeight = "30"
autocmd FileType ruby       map <Leader>vr :call VimuxRunCommand("clear; ruby -w " . bufname("%"))<CR>
autocmd FileType javascript map <Leader>vr :call VimuxRunCommand("clear; node " . bufname("%"))<CR>
autocmd FileType go         map <Leader>vr :call VimuxRunCommand("clear; go run " . bufname("%"))<CR>
autocmd FileType sh         map <Leader>vr :call VimuxRunCommand("clear;" . getline('.'))<CR>
autocmd FileType sh         nnoremap <leader>r 0y$:!clear; <C-R>"<CR>

" Elixir {{{
"
" Treat mix.lock file as Elixir code
autocmd BufNewFile,BufRead mix.lock setlocal filetype=elixir
autocmd Filetype elixir nnoremap <buffer> <Leader>r :!elixir %<cr>
autocmd Filetype elixir nnoremap <buffer> <Leader>k :!mix test %<cr>
autocmd Filetype elixir nnoremap <buffer> <Leader>K :execute "!mix test --only line:" . line(".") . " %"<cr>
autocmd Filetype elixir nnoremap <buffer> <Leader>vr :call VimuxRunCommand("clear; elixir " .  bufname("%"))<cr>
autocmd Filetype elixir nnoremap <buffer> <Leader>vk :call VimuxRunCommand("clear; mix test " . bufname("%"))<cr>
autocmd Filetype elixir nnoremap <buffer> <Leader>vK :call VimuxRunCommand("clear; mix test --only line:" . line(".") . " " .  bufname("%"))<cr>
" }}}

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
let test#strategy = "vimux"
" let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>

"" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


