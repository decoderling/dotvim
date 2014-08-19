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

" create an informative statusline for me
set statusline=\F\i\l\e\:\ %t\ %m\ \T\y\p\e\:\ %y%h%r%=\C\o\l\:\ %c\ \L\i\n\e\:\ %l\ \o\f\ %L\ %P

" colorize the statusline
hi statusline guifg=darkgreen guibg=grey ctermfg=darkblue ctermbg=white

" enable status line
set laststatus=2

" change statusline on insert mode
if version >= 700
    au InsertEnter * hi StatusLine ctermbg=red gui=undercurl guisp=Magenta guibg=green guifg=black
    au InsertLeave * hi StatusLine ctermbg=white gui=bold,reverse guibg=grey guifg=darkgreen
endif

" Quickly edit/reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Keep the buffers alive after the file is closed
set hidden

" add auto change of working directory per file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/
endif

" syntastic options
let g:syntastic_auto_loc_list = 1

" remap ctrl-p bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-mustache-handlebars options
let g:mustache_abbreviations = 1


" --------------[ Bracket completion stuff ]-----------
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>0
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap "" "<Esc>a
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap '' '<Esc>a
inoremap ' <c-r>=QuoteDelim("'")<CR>

" function to close the pair
function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" function to close the bracket
function CloseBracket()
  if match(getline(line('.') + 1), '\s*}') < 0
    return "\<CR>}"
  else
    return "\<Esc>j0f}a"
  endif
endf

" function to close quotes
function QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
    " check for inserting a quoted quotation mark 
    return a:char
  elseif line[col - 1] == a:char
    " escape out of the right string
    return "\<Right>"
  else
    " start a string
    return a:char.a:char."\<Esc>i"
  endif
endf
" --------------[ END Bracket completion stuff ]-----------

