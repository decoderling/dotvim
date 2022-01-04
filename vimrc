" ---------------------------
" __   _____ __  __ ___  ___ 
" \ \ / /_ _|  \/  | _ \/ __|
"  \ V / | || |\/| |   / (__ 
"   \_/ |___|_|  |_|_|_\\___|
"                            
"
"   By: David Lin
" ---------------------------

" ---[ BEGIN Standard VIM Configuration ]---
" default color scheme
colorscheme torte

" enable syntax highlighting
syntax on

" GUI options
set guifont=MesloLGSDZ\ Nerd\ Font:h11

" setup text formatting
set encoding=UTF-8

" tab/indent/shifting options
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set autoindent
set copyindent
set smartindent
set backspace=indent,eol,start
set shiftround
set number " show line numbers

" search options
set ignorecase
set smartcase
set hlsearch
set incsearch

set title " tell me the file

" backup options
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class

" history options
set history=1000
set undolevels=1000

set laststatus=2 " enable statusline
set hidden " keep buffers alive after the file is closed

" add auto change of working directory per file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/
endif

" change the default leader key
let mapleader=","

" clear highlighted searches
nmap <silent> <leader>/ :nohlsearch<CR>

" quickly edit/reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Map ASCII Border making
vmap <leader>f? :.!toilet -w 200 -d /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts
vmap <leader>F :.!toilet -w 200 -d /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts -f standard<CR>
vmap <leader>f :.!toilet -w 200 -d /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts -f small<CR>
vmap <leader>Fb :.!toilet -w 200 -d /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts -F border<CR>
vmap <leader>fb :.!toilet -w 200 -d /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts -f small -F border<CR>
vmap <leader>b :.!toilet -w 200 -d /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts -F border<CR>
" ---[ END Standard VIM Configuration ]---

" Setup vim-plug
" ---[ Setup auto-install of vim-plug ]---
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins into '~/.vim/plugged'
call plug#begin('~/.vim/plugged')

" =================================
" ------[ BEGIN add plugins ]------
" =================================
" Collection of syntax and linters
Plug 'dense-analysis/ale'
" Git commands in Vim
Plug 'tpope/vim-fugitive'
" Surrounding text and selections with stuff
Plug 'tpope/vim-surround'
" For matching enclosures
Plug 'jiangmiao/auto-pairs'
" Cursor repeat
Plug 'kien/ctrlp.vim'
" Navigation
Plug 'scrooloose/nerdcommenter' | Plug 'scrooloose/nerdtree'
" Basically SnipMate support
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate' | Plug 'honza/vim-snippets'
" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': ['javascript', 'typescript'] }
" JSX syntax
Plug 'maxmellon/vim-jsx-pretty'
" GraphQL syntax
Plug 'jparise/vim-graphql'
" Pretty Status Line
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
" Multiple editing
Plug 'terryma/vim-multiple-cursors'
" Puppet Syntax Highlighting
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
" Simple repeating of commands
Plug 'tpope/vim-repeat'
" Scala syntax
Plug 'derekwyatt/vim-scala'
" HTML shorthand
Plug 'rstacruz/sparkup'
" TOML syntax
Plug 'cespare/vim-toml'
" ===============================
" ------[ END add plugins ]------
" ===============================

" Now initialize the plugin system
call plug#end()

" ---[ BEGIN Configuration Settings ]---
" ===Airline===
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" ===ALE===
" remap shortcuts
nmap <leader>ap :ALEPrevious<CR>
nmap <leader>an :ALENext<CR>
nmap <leader>at :ALEToggle<CR>
nmap <leader>ad :ALEDetail<CR>
nmap <leader>af :ALEFix<CR>
" option settings
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['javascriptreact'] = ['prettier']
let g:ale_fixers['typescriptreact'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_javascript_prettier_use_local_config = 1

" ===CtrlP===
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ===NERDCommenter===
let g:NERDSpaceDelims = 1 " add a space after comment markers
let g:NERDDefaultAlign = 'left' 

" ===NERDTree===
nmap <leader>nt :NERDTree<CR>
let g:NERDTreeShowHidden = 1

" ===SNIPMATE===
" Annoyingly snipmate is out of date, so use the newest
let g:snipMate = { 'snippet_version' : 1 }

" Sparkup only works on HTML files by default, allow jsx and tsx too
autocmd BufReadPost,BufNewFile *.[j|t]sx runtime ftplugin/html/sparkup.vim
" ---[ END Configuration Settings ]---
