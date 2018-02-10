"
" .vimrc config file
"

" Load pathogen yum!
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('bundle/{}')
call pathogen#helptags()

" set my default color scheme
colorscheme torte

" I need my syntax highlighting!
syntax on

" set formatting properties
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set autoindent
set copyindent
set smartindent
set backspace=indent,eol,start
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set nobackup
set noswapfile
 
" change the leader mapping from \ to .
let mapleader=","

" clear highligh search
nmap <silent> <leader>/ :nohlsearch<CR>

" set undo levels
set history=1000
set undolevels=1000

" turn on snippets
set nocompatible
filetype on
filetype plugin indent on

" enable status line
set laststatus=2

" Keep the buffers alive after the file is closed
set hidden

" add auto change of working directory per file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/
endif

" ------[ BEGIN key remapping ]------
" Quickly edit/reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Mapping to toggle NERDTree with a convenient leader
nmap <leader>nt :NERDTree<CR>
" ------[ END key remapping ]------

" ------[ BEGIN syntastic options ]------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '⛔'
let g:syntastic_style_error_symbol = '🚫'
let g:syntastic_warning_symbol = '❗'
let g:syntastic_style_warning_symbol = '💩'

"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn
" ------[ END syntastic options ]------

" remap ctrl-p bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-mustache-handlebars options
let g:mustache_abbreviations = 1

