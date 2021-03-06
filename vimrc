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
set shiftwidth=2
set softtabstop=2
set tabstop=2
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

" Mapping ale shortcuts
nmap <leader>ap :ALEPrevious<CR>
nmap <leader>an :ALENext<CR>
nmap <leader>at :ALEToggle<CR>
nmap <leader>ad :ALEDetail<CR>
nmap <leader>af :ALEFix<CR>
" ------[ END key remapping ]------

" ------[ BEGIN ale options ]------
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
"let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_prettier_use_local_config = 1
" ------[ END ale options ]------

" remap ctrl-p bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-mustache-handlebars options
let g:mustache_abbreviations = 1

" vdebug options
let g:vedebug_options = {}
let g:vedebug_options['debug_window_level'] = 2
let g:vedebug_options['debug_file_level'] = 2
