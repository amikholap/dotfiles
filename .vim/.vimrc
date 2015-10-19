set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'exu/pgsql.vim'
Plugin 'elentok/plaintasks.vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'xolox/vim-session'

call vundle#end()
filetype plugin indent on


" ***** GENERAL CONFIG *****

" Remap leader from \ to ,
let mapleader=","

" Russian keymap for insert mode
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Override default colors for syntax highlighting
syntax on

" Force plpgsql syntax highlighting
au BufRead,BufNewFile *pgsql,*plpgsql setf pgsql

" Wrap text after a certain number of characters and highlight 120-char mark with python code
au BufRead,BufNewFile *py set textwidth=120
au BufRead,BufNewFile *py set colorcolumn=120

" 2 space indentation for HTML and CSS
autocmd FileType html,css set shiftwidth=2

" TEX files:
"   * 2 space indentation
"   * spellcheck
autocmd FileType tex set shiftwidth=2
autocmd FileType tex set spell spelllang=ru_ru,en_us

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their line endings.
set fileformat=unix

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescrolloff=2

set tabstop=4
set shiftwidth=4

" Replace tabs with spaces
set expandtab

" Bash style completion
set wildmode=list:longest

" Display line numbers
set number

" Highligh search results dynamically while typing
set hlsearch
set incsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Search before cursor too
set wrapscan

" Case sensitive search only if query contains capital letter
set ignorecase
set smartcase

" Set the default file encoding to UTF-8: 
set encoding=utf-8

" Change charset by F8
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.utf-8        :e ++enc=utf-8 <CR>
map <F8> :emenu Encoding.<TAB>

" Enable backup files in temp folder
set noswapfile " disable swap - all buffers will be opened in memory
set backup
set backupdir=/tmp
set backupskip=/tmp/*
set writebackup


" ***** SHORTCUTS *****

" Exit from insert mode
imap jj <Esc>

" Highlight line under cursor
nnoremap <Leader>c :set cursorline!<CR>

" Easy split window navigation
" use ALT+navigation key to switch split windows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Tab change by Alt-Left/Right
nmap <M-Right> gt
nmap <M-Left> gT
imap <M-Right> <C-O>gt
imap <M-Left> <C-O>gT


" ***** PLUGINS *****

" NERDTree
noremap <silent> <F10> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\~$']

" sessions
" Disable session autosave dialog
let g:session_autosave='no'

" TagBar
nmap <F9> :TagbarToggle<CR>

" Syntastic
" Set flake8 max line length to 120 characters
let g:syntastic_python_flake8_args = "--max-line-length=120"

" Emmet
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" ***** VISUALS *****

" solarized is really ugly without gui
if has('gui_running')
    colorscheme solarized
else
    colorscheme slate
endif
set background=dark

set guioptions-=T
set guifont=Inconsolata\ Medium\ 14

" Display tab numbers
set guitablabel=[%N]\ %f
