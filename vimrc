filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set guifont=consolas:h9
set guioptions-=T

" change leader key
let mapleader=","

" quicker escaping
inoremap jj <ESC>

" Basic editor settings
set background=dark
colorscheme solarized
set colorcolumn=80
set backupdir=$TMP
set directory=$TMP
set nocompatible
set number
set numberwidth=1
set ruler
set encoding=utf-8
set wildignore+=*.pyc
set showcmd
set title
set ruler
set laststatus=2
set hidden  "ability to change buffers without saving current buffer
set wildmenu
set wildmode=longest,full
set history=1000
set undolevels=1000
set relativenumber

" persistant undos
set undofile
set undodir=$TMP

" whitespace
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set smarttab

" show trailing whitespace as dot
set list listchars=tab:\ \ ,trail:·

" no bells
set noerrorbells visualbell t_vb=
if has('autocmd')
      autocmd GUIEnter * set visualbell t_vb=
endif

" searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
nnoremap <tab> %
vnoremap <tab> %

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" prevent fat fingering <f1> when reaching for <esc>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

" re-hardwrap paragraph
nnoremap <leader>q gqip

" select text that was just pasted
nnoremap <leader>v V`]

" Editing
"code folding
set foldmethod=indent
set foldlevel=99

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" quick window vertical window split
nnoremap <leader>w <C-w>v<C-w>l

" window split key maps
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" save file keymap
nmap <leader>s :w<CR>

""Syntax highlighting and validation
syntax on
filetype on
filetype plugin indent on "enable loading indent for filetype

" flake 8
autocmd FileType python map <buffer> <leader>8 :call Flake8()<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " save last search and cursor position
    let _s =@/
    let l = line(".")
    let c = col(".")
    " do it"
    %s/\s\+$//e
    " clean up "
    let @/ = _s
    call cursor(l, c)
endfunction

" rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map <leader>n :call RenameFile()<cr>

" fix colors for terms with only 256 colors
function! FixColors()
    let g:solarized_termcolors=256
    colorscheme solarized
endfunction

map <leader>c :call FixColors()<cr>

" turn off autoclose mapping
map <leader>a :AutoCloseToggle<cr>

" map strip trailing whitespace to F5
nnoremap <silent> <leader>W :call <SID>StripTrailingWhitespaces()<CR>

" GundoToggle
map <leader>g :GundoToggle<CR>

" remove trailing whitespace on write for py,js
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" use hard tabs in gitconfig files
autocmd FileType gitconfig setl noexpandtab ts=4

" ruby specific whitespace settings
autocmd FileType ruby,eruby,yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" don't change working directory when opening a new file
let g:ctrlp_working_path_mode = 0
"
" crtlp
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.gdb$',
    \ 'file': '\.exe$\|\.so$\|\.dll$|\.pyc$|\.tbx$',
    \ }

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $REALVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins

" don't autoclose apostrophes in lisps
autocmd FileType lisp,clojure let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "'")

runtime macros/matchit.vim
