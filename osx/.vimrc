" Vundle Plugins {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'rizzatti/dash.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
" Colorscheme
Plugin 'w0ng/vim-hybrid'
Plugin 'altercation/vim-colors-solarized'
" Syntax highlight scheme
Plugin 'jez/vim-ispc'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pangloss/vim-javascript'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" Allow plugins to control our indentation
filetype plugin indent on    " required


" Plugins Setting {{{

""""""""""syntastic""""""""""""  
let g:syntastic_check_on_open = 1  
let g:syntastic_cpp_include_dirs = ['/usr/include/']  
let g:syntastic_cpp_remove_include_errors = 1  
let g:syntastic_cpp_check_header = 1  
let g:syntastic_cpp_compiler = 'clang++'  
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"set error or warning signs  
let g:syntastic_error_symbol = 'x'  
let g:syntastic_warning_symbol = '!'  
""whether to show balloons  
let g:syntastic_enable_balloons = 1  
  
""""""""""""YCM""""""""""""""""""""  
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  
let g:ycm_collect_identifiers_from_tags_files = 1  
let g:ycm_seed_identifiers_with_syntax = 1  
let g:ycm_confirm_extra_conf = 0  

"""""""""Powerline""""""""""
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

"""""""""CtrlP""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" }}}
" }}}

" Environment Setting {{{

syntax on

set nu
set cursorline

" Highlight search
set hls

" Incremental search (search as characters are entered)
set incsearch

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Per Project vimrc
set exrc
set secure

" Number of lines before bottom when scrolling vertically
set so=10 

" Set each auto-indent level to equal two spaces
set shiftwidth=2

" Let each tab equal two spaces
set tabstop=2

" This is the number of spaces that is inserted when you hit 
" <TAB> and also the number of spaces that are removed when 
" you backspace
set softtabstop=2

" Make sure vim turns all tabs into spaces
set expandtab

" Make vim indent our code properly
set smartindent

" Enable folding
set foldenable

" Fold based on syntax
set foldmethod=syntax

" Open most folds on start
set foldlevelstart=10

" Nested fold max
set foldnestmax=10

" Make the maximum line length equal 120
" set lbr
" set textwidth=120 fo=cqt wm=0

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" Use a cool menu when autocompleting filenames, commands, etc...
set wildmenu
set wildmode=list:longest

" Make vim automatically change directories to the directory of any file you open. 
" This means that when you open a file, then want to open another using :tabe, :o, etc,
" you can just type in the relative path from the file you're currently editing.
set autochdir

" Remove scrollbar in GUI
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" set autowrite
" set autowriteall

" Use modeline
set modelines=1

" Make statusline displayed all the time (for powerline)
set laststatus=2 
"---------------------------- My Cool Stuff -------------------------------
if (has("gui_running"))
  syntax enable
  set background=dark
  " colorscheme solarized
  colorscheme hybrid
  
  " colorscheme molokai
  set lines=35 columns=120
  set guifont=Inconsolata\ for\ Powerline:h15
else
  " Same scheme with terminal
  colorscheme smyck
  set term=xterm-256color " for powerline
endif

" }}}

" Key Mapping {{{

" Open in Dash
nmap <silent> <leader>d <Plug>DashSearch

" NERDTree
nmap <silent> <leader>s :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>

" Tagbar
nmap <F3> :TagbarToggle<CR>

" fugitive
nnoremap <C-g>s :Gstatus<CR>
nnoremap <C-g>c :Gcommit<CR>

" Space open/closes folds
nnoremap <space> za

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" highlight last inserted text
nnoremap vv `[v`]

" Automatic closing curly brace and putting cursor to the right place
imap {<CR> {<CR>}<ESC>O

" Commentary.vim tricks
" Map <D-/> (Command-/) as comment toggle
" Sadly this trick only works in MacVim, no CLI support
imap <silent><D-/> <ESC>gcca
nmap <silent><D-/> gcc
vmap <silent><D-/> gc

" Rebuild CTags
nmap <silent><D-t> :!ctags -R .<CR>

" Run code
autocmd FileType python nnoremap <buffer> <D-r> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType c nnoremap <silent> <D-r> :!clear;gcc % -o % && ./%<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
