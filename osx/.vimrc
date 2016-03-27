set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "{{{
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set term=xterm-256color
"}}}
Plugin 'Valloric/YouCompleteMe' "{{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  
let g:ycm_collect_identifiers_from_tags_files = 1  
let g:ycm_seed_identifiers_with_syntax = 1  
let g:ycm_confirm_extra_conf = 0  
"}}}
Plugin 'scrooloose/syntastic' "{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_check_on_open = 1  
let g:syntastic_cpp_include_dirs = ['/usr/include/']  
let g:syntastic_cpp_remove_include_errors = 1  
let g:syntastic_cpp_check_header = 1  

let g:syntastic_python_checkers = ['pylint']

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "!"
"}}}
Plugin 'scrooloose/nerdtree' "{{{
nmap <silent> <leader>s :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>
"}}}
Plugin 'kien/ctrlp.vim' "{{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"}}}
Plugin 'rizzatti/dash.vim' "{{{
nmap <silent> <leader>d <Plug>DashSearch
"}}}
Plugin 'majutsushi/tagbar' "{{{
nmap <F3> :TagbarToggle<CR>
"}}}
Plugin 'tpope/vim-fugitive' "{{{
nnoremap <C-g>s :Gstatus<CR>
nnoremap <C-g>c :Gcommit<CR>
"}}}
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'tpope/vim-surround'

" Colorscheme
Plugin 'w0ng/vim-hybrid'
" Plugin 'altercation/vim-colors-solarized'

" Syntax highlight scheme
Plugin 'jez/vim-ispc'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"}}}

" Environment Setting

syntax on

" Allow plugins to control our indentation
filetype plugin indent on

set nu
set cursorline

" Highlight search and incremental search
set hls incsearch

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j 
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Per Project vimrc
set exrc secure

" Number of lines before bottom when scrolling vertically
set so=10 

" 1. Set each auto-indent level to equal two spaces
" 2. Let each tab equal two spaces
" 3. The number of spaces that is inserted when you hit <TAB> and
"    also the number of spaces that are removed when you backspace
" 4. Make sure vim turns all tabs into spaces
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Make vim indent our code properly
set smartindent

" 1. Enable folding
" 2. Fold based on syntax
" 3. Open most folds on start
" 4. Nested fold max
set foldenable foldmethod=syntax foldlevelstart=10 foldnestmax=10

" Make the maximum line length equal 120
" set lbr textwidth=120 fo=cqt wm=0

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" Use a cool menu when autocompleting filenames, commands, etc...
set wildmenu wildmode=list:longest

" Make vim automatically change directories to the directory of any file you open. 
" This means that when you open a file, then want to open another using :tabe, :o, etc,
" you can just type in the relative path from the file you're currently editing.
" set autochdir

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

" I can type :help on my own, thanks.
noremap <F1> <Esc>

if (has("gui_running"))
  syntax enable
  set background=dark
  colorscheme hybrid
  set lines=35 columns=120
  set guifont=Inconsolata\ for\ Powerline:h15
else
  " Same scheme with terminal
  colorscheme smyck
endif

" Key Mapping"

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
" nnoremap vv `[v`]

" Automatic closing curly brace and putting cursor to the right place
inoremap {<CR> {<CR>}<ESC>O

" Commentary.vim tricks
" Map <D-/> (Command-/) as comment toggle
" Sadly this trick only works in MacVim, no CLI support
imap <silent><D-/> <ESC>gcca
nmap <silent><D-/> gcc
vmap <silent><D-/> gc

" Rebuild CTags
nnoremap <silent><D-t> :!ctags -R .<CR>

" Run code
autocmd FileType python nnoremap <buffer> <D-r> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType c nnoremap <silent> <D-r> :!clear;gcc % -o % && ./%<CR>

" vim:foldmethod=marker:foldlevel=0
