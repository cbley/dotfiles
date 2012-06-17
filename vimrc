filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set guifont=consolas:h9
set guioptions-=T

" change leader key
let mapleader=","

" Basic editor settings
set background=dark
colorscheme solarized
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
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

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

" window split key maps
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

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

" turn off autoclose mapping
map <leader>a :AutoCloseToggle<cr>

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" map strip trailing whitespace to F5
:nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" GundoToggle
map <leader>g :GundoToggle<CR>

" remove trailing whitespace on write for py,js
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" use hard tabs in gitconfig files
autocmd FileType gitconfig setl noexpandtab ts=4

" don't change working directory when opening a new file
let g:ctrlp_working_path_mode = 0
"
" crtlp
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.gdb$',
    \ 'file': '\.exe$\|\.so$\|\.dll$|\.pyc$|\.tbx$',
    \ }

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $REALVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


runtime macros/matchit.vim
