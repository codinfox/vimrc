set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'rizzatti/dash.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'parkr/vim-jekyll'
Plugin 'suan/vim-instant-markdown'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""syntastic""""""""""""  
let g:syntastic_check_on_open = 1  
let g:syntastic_cpp_include_dirs = ['/usr/include/']  
let g:syntastic_cpp_remove_include_errors = 1  
let g:syntastic_cpp_check_header = 1  
let g:syntastic_cpp_compiler = 'clang++'  
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
"set error or warning signs  
"let g:syntastic_error_symbol = 'x'  
"let g:syntastic_warning_symbol = '!'  
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
set term=xterm-256color
set termencoding=utf-8

""""""""Instant Markdown""""""""
let g:instant_markdown_slow = 1

"""""""LaTeX-Suite""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'



"-------------Essential NRT Style Compliance Settings-------------
 
" Disable old-school vi compatability
set nocompatible

" Allow plugins to control our indentation
filetype plugin indent on

" Set each auto-indent level to equal two spaces
set shiftwidth=2

" Let each tab equal two spaces
set tabstop=2

" Make sure vim turns all tabs into spaces
set expandtab

" Make vim indent our code properly
set smartindent

" Make the maximum line length equal 120
set lbr
set textwidth=120 fo=cqt wm=0

"-------------Other cool vim tricks-------------

" Use a cool menu when autocompleting filenames, commands, etc...
set wildmenu
set wildmode=list:longest

" Make vim automatically change directories to the directory of any file you open. 
" This means that when you open a file, then want to open another using :tabe, :o, etc,
" you can just type in the relative path from the file you're currently editing.
set autochdir

"---------------------------- End for NRT ---------------------------------

"---------------------------- My Cool Stuff -------------------------------
if (has("gui_running"))
  colorscheme molokai
  set lines=35 columns=120
  set guifont=Inconsolata\ for\ Powerline:h15
else
  " Same scheme with terminal
  colorscheme smyck
endif

nmap <silent> <leader>d <Plug>DashSearch

set t_Co=256
set nu

map <F2> :NERDTreeToggle<CR>

set hls
set autowrite
set autowriteall
set laststatus=2 "make statusline displayed all the time

nmap <silent> <leader>s :NERDTreeFind<CR>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Customize GVIM tabname
" Set tabname with let t:mytablabel="tabname"
function! GuiTabLabel()
  return exists('t:tabname') ? t:tabname : ''
endfunction
set guitablabel=%{GuiTabLabel()}
set go+=e

syntax on

" Automatic closing curly brace and putting cursor to the right place
imap {<CR> {<CR>}<ESC>O

" Commentary.vim tricks
" Map <D-/> (Command-/) as comment toggle
" Sadly this trick only works in MacVim, no CLI support
imap <silent><D-/> <ESC>gcca
nmap <silent><D-/> gcc
vmap <silent><D-/> gc

