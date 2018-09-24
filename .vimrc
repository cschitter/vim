" vimrc file inspired from"
"https://github.com/Houdini/my_vim_files/blob/master/vimrc

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

""" VUNDLE Start

if has("win32")     " set the runtime path to include Vundle and initialize {{{
    set rtp+=$VIM/bundle/Vundle.vim
elseif has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
if has("win32")     " alternatively, pass a path where Vundle should install plugins
    call vundle#begin('$VIM/bundle')
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "required
Plugin 'scrooloose/nerdtree'
    nmap wm :NERDTree<cr>
    let NERDTreeIgnore=['\.swp$']
    nmap <F3> :NERDTreeToggle<CR>
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
"Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplCycleArround = 1
    let g:miniBufExplorerAutoStart = 1
    let g:miniBufExplBuffersNeeded = 1
    let g:miniBufExplShowBufNumbers = 0
    "let g:miniBufExplForceSyntaxEnable = 1
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'w0rp/ale'
    "nmap <F7> :ALEToggle<CR><CR>
    "let g:ale_python_pylint_options = '--load-plugins pylint'
    ":ALEDisable

" Unused plugins
    "Plugin 'alloric/YouCompleteMe' " requires python and plugin compile
    "Plugin 'Shougo/neocomplete.vim' " requires lua
    "Plugin 'shougo/deoplete.nvim'
    "Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" VUNDLE end 

set backspace=indent,eol,start      "allow backspacing over everything in insert mode

set history=1000    " store lots of :cmdline history

set showcmd         "show incomplete cmds down the bottom
set showmode        "show current mode down the bottom

set hlsearch        " highlight searches
set incsearch       " do incremental searching

set number          "add line numbers
set showbreak=...
set nowrap linebreak nolist

set linespace=0         "add some line space for easy reading. Or not
set visualbell t_vb=    "disable visual bell

set statusline=%f "tail of the filename
"set statusline+=%{fugitive#statusline()} " Git
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}  "RVM
set statusline+=%= "left/right separator
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

set nobackup
set noswapfile

set tabstop=4       "indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

"set foldmethod=indent " Folding settings
"set foldnestmax=3   "deepest fold is 3 levels
"set nofoldenable    "dont fold by default
"set foldlevel=99
"set foldcolumn=5

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set listchars=tab:▸\ ,eol:¬,extends:>,precedes:<   "display tabs and trailing spaces

set nolist

" Use the same symbols as TextMate for tabstops and EOLs
" disabling list because it interferes with soft wrap
set formatoptions-=o "dont continue comments when pushing o/O

set scrolloff=3         "vertical/horizontal scroll off settings
set sidescrolloff=7
set sidescroll=1

filetype plugin on      "load ftplugins and indent files
filetype indent on

syntax on       "turn on syntax highlighting

set mouse=a     "some stuff to get the mouse going in term
set ttymouse=xterm2

set hidden      " hide buffers instead of closing them

"Activate smartcase
set ic
set smartcase

set cul             " display cursor line
set showmatch

set ruler           " show the cursor position all the time
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file

"set ignorecase     " ignore case when searching
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files

set expandtab

set t_kD=         " backspace and del
set t_kb=
fixdel
noremap! <C-?> <C-h>

set wildmode=list:longest   " Path/file expansion in colon-mode.
set wildchar=<TAB>

set tags=~/tags,tags
set mouse=ar
set makeprg=make

set virtualedit=all " move the cursor all around

set clipboard=unnamedplus       " copy/paste into system clipboard

if has("gui_running")
"tell the term has 256 colors
    set t_Co=256

    colorscheme claude
    set guitablabel=%M%t
    set lines=75
    set columns=150

    set guioptions-=T  "turn off needless toolbar on gvim/mvim

    "turn off the scroll bar
    set guioptions-=L
    set guioptions-=r

    "set guifont=Monospace\ 9
    set guifont=Hack\ 9
    if has("gui_gnome")
        "set term=gnome-256color
        colorscheme claude
        set guifont=Hack\ 9
    endif
    if has("gui_mac") || has("gui_macvim")
        colorscheme claude
        set guifont=Hack\ 9
     endif
    if has("gui_win32") || has("gui_win32s")
        colorscheme claude
        set guifont=Hack\ 9
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme claude
    else
        if $TERM == 'xterm'
            set term=xterm-256color
            colorscheme claude
        else
            colorscheme default
        endif
    endif
endif

noremap Q gq    "map Q to something useful: formatting
nnoremap Y y$   "make Y consistent with C and D

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction


nmap <C-s> :w<CR>               "key mapping for saving file

nmap <S-Tab> gt                 "key mapping for tab navigation
nmap <C-S-Tab> gT

imap {<CR> {}<ESC>i<CR><ESC>O   " when press { + Enter, the {} block will expand.

"noremap <C-TAB>   :MBEbb<CR>    " buffer navigation
"noremap <C-S-TAB> :MBEbf<CR>
"noremap <C-J> :MBEbb<CR>
"noremap <C-K> :MBEbb<CR>
"noremap <C-H> :MBEbf<CR>
"noremap <C-J> :MBEbf<CR>

map <C-TAB>   :MBEbb<CR>    " buffer navigation
map <C-S-TAB> :MBEbf<CR>
map <C-J> :MBEbb<CR>
map <C-K> :MBEbb<CR>
map <C-H> :MBEbf<CR>
map <C-J> :MBEbf<CR>

"nnoremap <space> za " space open/closes folds

map <c-j> <c-w>j    "window split
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-q> <C-w>c
"map <c-]> :split<CR>
"map <c-[> :vsplit<CR>
          
filetype plugin on  " active plugins
" abbreviation
"iabbrev ,python #!/usr/bin/python

inoremap jj <ESC>   " exit insert mode with jj and kk in addition to <ESC>
inoremap kk <ESC>

vmap <Leader>x "*x  " copy/paste from clipboard
vmap <Leader>c "*y
nmap <Leader>c "*y
vmap <Leader>v "*P
nmap <Leader>v "*P

nmap <leader>l :set list!<CR>   " Shortcut to rapidly toggle `set list`
nmap <leader>w :set wrap!<CR>   "Toggle line wrap

nnoremap + <C-a>        " increase/decrease numbers
nnoremap - <C-x>

nmap <silent> // :nohlsearch<CR>    " undisplay finds

