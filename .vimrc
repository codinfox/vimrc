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
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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

"""""""""""vim-airline""""""""""""
let g:airline_powerline_fonts = 1

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
set textwidth=120 fo=cqt wm=0

"-------------Other cool vim tricks-------------

" Use a cool menu when autocompleting filenames, commands, etc...
set wildmenu
set wildmode=list:longest

" Make vim automatically change directories to the directory of any file you open. 
" This means that when you open a file, then want to open another using :tabe, :o, etc,
" you can just type in the relative path from the file you're currently editing.
set autochdir

" When editing the NRT library, it is a total pain when you are editing a .H file in nrt/include/whatever/whatever, 
" and then decide you need to edit the source .C file in the nrt/src/whatever/whatever. This little function will 
" automatically back track in the directory tree for you, find the corresponding .C or .H file, and open it in a new
" tab. 
" To use it, just type ,o (that's a comma, and then a lower-case o). 
function! OpenOther()
  if expand("%:e") == "C"
    exe "tabe" fnameescape(expand("%:p:r:s?src?include?").".H")
  elseif expand("%:e") == "H"
    exe "tabe" fnameescape(expand("%:p:r:s?include?src?").".C")
  endif
endfunction
nmap ,o :call OpenOther()<CR>


colorscheme molokai

set t_Co=256
set nu
set lines=40 columns=150

map <F2> :NERDTreeToggle<CR>

set hls
set autowrite
set autowriteall
set laststatus=2 "make statusline displayed all the time

nmap ,s :NERDTreeFind<CR>

" auto reload the vimrc after changes
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
