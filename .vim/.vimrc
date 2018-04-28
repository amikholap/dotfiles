set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'w0rp/ale'
Plugin 'pearofducks/ansible-vim'
Plugin 'ctrlpvim/ctrlp.vim'
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
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'xolox/vim-misc'
Plugin 'uarun/vim-protobuf'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'xolox/vim-session'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'lervag/vimtex'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


" ***** GENERAL CONFIG *****

" Remap global and local leaders to ,
let mapleader=","
let maplocalleader=","

" Russian keymap for insert mode
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Override default colors for syntax highlighting
syntax on

" Force plpgsql syntax highlighting
au BufRead,BufNewFile *pgsql,*plpgsql setf pgsql

" Wrap text after a certain number of characters and highlight 100-char mark with python code
au BufRead,BufNewFile *py set textwidth=100
au BufRead,BufNewFile *py set colorcolumn=100

" 4 space indentation for HTML, CSS and Javascript
autocmd FileType html,css,javascript set shiftwidth=4

" TEX files:
"   * 2 space indentation
"   * spellcheck
autocmd FileType tex set shiftwidth=2
autocmd FileType tex set spell spelllang=ru_ru,en_us

" YAML files:
"   * 2 space indentation
autocmd FileType yaml,yml set shiftwidth=2

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their line endings.
set fileformat=unix

" Fix backspace deleting only characters typed in the current insert session.
set backspace=indent,eol,start

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

" Change charset by F7
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.utf-8        :e ++enc=utf-8 <CR>
map <F7> :emenu Encoding.<TAB>

" Enable backup files in temp folder
set noswapfile " disable swap - all buffers will be opened in memory
set backup
set backupdir=/tmp
set backupskip=/tmp/*
set writebackup


" ***** SHORTCUTS *****

" Exit from insert mode
imap jj <Esc>

" Write buffer
map <Leader>w :w<CR>

" Highlight line under cursor
nnoremap <Leader>c :set cursorline!<CR>

" Insert pdb.set_trace under the current line
map <Leader>b oimport pdb; pdb.set_trace()<Esc>

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

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_python_pylint_options = '--rcfile=~/.pylintc'

" NERDTree
noremap <silent> <F10> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\~$']

" sessions
" Disable session autosave dialog
let g:session_autosave='no'
let g:session_persist_globals = [
    \ 'g:ale_python_pylint_options',
    \ 'g:syntastic_python_checkers',
    \ 'g:syntastic_python_pylint_args',
    \ 'g:syntastic_python_pylint_post_args'
    \]

" TagBar
nmap <F9> :TagbarToggle<CR>

" Syntastic
" Set path to pylintrc
let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc'
let g:syntastic_python_pylint_post_args = ''
" Max line length for flake8
let g:syntastic_python_flake8_args = "--max-line-length=120"
" Modify statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Update the location-list automatically
let g:syntastic_always_populate_loc_list = 1
" Open error window when errors are detected and close it after they're fixed
let g:syntastic_auto_loc_list = 1
" Don't run syntax checks when closing a buffer
let g:syntastic_check_on_wq = 0

" Emmet
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vimtex
" Disable latexmk interface
let g:vimtex_latexmk_enabled = 0

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_error_symbol = '☓'
let g:ycm_warning_symbol = '☝'
let g:ycm_filetype_whitelist = {
    \ 'cpp': 1
    \}
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'csv' : 1,
    \ 'diff' : 1,
    \ 'gitcommit' : 1,
    \ 'help' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1,
    \ 'markdown' : 1,
    \ 'notes' : 1,
    \ 'pandoc' : 1,
    \ 'qf' : 1,
    \ 'svn' : 1,
    \ 'tagbar' : 1,
    \ 'text' : 1,
    \ 'unite' : 1,
    \ 'vimwiki' : 1
    \}
autocmd FileType c,cpp nnoremap <Leader>] :YcmCompleter GoTo<CR>
autocmd FileType c,cpp nnoremap <Leader>] :YcmCompleter GoTo<CR>
autocmd FileType c,cpp nnoremap <Leader>l :YcmDiags<CR>
autocmd FileType c,cpp nnoremap <Leader>h :YcmCompleter GetDoc<CR>


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
