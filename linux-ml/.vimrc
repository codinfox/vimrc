set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-airline/vim-airline' "{{{
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
"set term=xterm-256color
"}}}
Plugin 'scrooloose/syntastic' "{{{
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

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
Plugin 'majutsushi/tagbar' "{{{
nmap <F3> :TagbarToggle<CR>
"}}}
Plugin 'tpope/vim-fugitive' "{{{
nnoremap <C-g>s :Gstatus<CR>
nnoremap <C-g>c :Gcommit<CR>
"}}}
Plugin 'tpope/vim-commentary' "{{{
" Commentary.vim tricks
" Map <D-/> (Command-/) as comment toggle
" Sadly this trick only works in MacVim, no CLI support
imap <silent><D-/> <ESC>gcca
nmap <silent><D-/> gcc
vmap <silent><D-/> gc
"}}}
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kshenoy/vim-signature'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'KabbAmine/zeavim.vim'
" Plugin 'Yggdroot/indentLine'

" Colorscheme
" Current colorscheme Tomorrow is not managed by Vundle
Plugin 'w0ng/vim-hybrid'
Plugin 'jacoborus/tender.vim'

" Syntax highlight scheme
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

" Make vim indent our code properly
set smartindent

" 1. Enable folding
" 2. Fold based on syntax
" 3. Open most folds on start
" 4. Nested fold max
set foldenable " foldmethod=syntax foldlevelstart=10 foldnestmax=10

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

" Remove GUI tab, use graphical instead
set guioptions-=e

" Remove the GUI toolbar
set guioptions-=T
" Remove the GUI menu
set guioptions-=m

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
  colorscheme tender "hybrid, Tomorrow
  set lines=35 columns=120
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 13
else
  " Same scheme with terminal
  colorscheme tender "smyck
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

" Rebuild CTags
nnoremap <silent><D-t> :!ctags -R .<CR>

" Run code
autocmd FileType python nnoremap <buffer> <D-r> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType c nnoremap <silent> <D-r> :!clear;gcc % -o % && ./%<CR>

" When there is only one matched tag, jump; otherwise, let me choose
nnoremap <C-]> g<C-]>

" X to close tab
nnoremap X :tabclose<CR>

" Single stroke to navigate tabs
nnoremap H gT
nnoremap L gt

" Highlight column 80 and area above 100
highlight ColorColumn ctermbg=236 guibg=#2c2d27
autocmd Filetype python let &colorcolumn="80"
autocmd Filetype cpp let &colorcolumn="100"

" 1. Set each auto-indent level to equal two spaces
" 2. Let each tab equal two spaces
" 3. The number of spaces that is inserted when you hit <TAB> and
"    also the number of spaces that are removed when you backspace
" 4. Make sure vim turns all tabs into spaces
autocmd Filetype cpp set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd Filetype python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Customized Appearance {{{

" Change the color for tabline
" hi TabLine      guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
" hi TabLineSel   guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=235 cterm=bold
" hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none

" Change the color for vertical split bar
" hi VertSplit ctermfg=235 ctermbg=238
hi VertSplit ctermfg=0

" Change the search highlight
hi Search guifg=#ffffff ctermfg=15 guibg=#008787 ctermbg=30 gui=bold cterm=bold

" Change Supertab dropdown
hi Pmenu ctermbg=238 ctermfg=255 guibg=#444444 guifg=#eeeeee
hi PmenuSel ctermbg=214 ctermfg=232 guibg=#ffaf00 guifg=#eeeeee

"}}}

" vim:foldmethod=marker:foldlevel=0
