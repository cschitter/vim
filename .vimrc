
" vimrc file inspired from
"https://github.com/Houdini/my_vim_files/blob/master/vimrc

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

""" VUNDLE Start

" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=$VIM/bundle/Vundle.vim
elseif has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
if has("win32")
    call vundle#begin('$VIM/bundle')
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "required
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe' " requires python and plugin compile
"Plugin 'Shougo/neocomplete.vim' " requires lua
"Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'

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

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom

set hlsearch        " highlight searches
set incsearch       " do incremental searching
nmap <silent> // :nohlsearch<CR>

set number "add line numbers
set showbreak=...
set nowrap linebreak nolist

"add some line space for easy reading. Or not (Claude)
set linespace=0

"disable visual bell
set visualbell t_vb=

"statusline setup
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

"recalculate the trailing whitespace warning when idle, and after saving
"autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
"autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" Disable long line warning (Claude)
"recalculate the long line warning when idle and after saving
"autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
"function! StatuslineLongLineWarning()
    "if !exists("b:statusline_long_line_warning")
        "let long_line_lens = s:LongLines()

        "if len(long_line_lens) > 0
            "let b:statusline_long_line_warning = "[" .
                        "\ '#' . len(long_line_lens) . "," .
                        "\ 'm' . s:Median(long_line_lens) . "," .
                        "\ '$' . max(long_line_lens) . "]"
        "else
            "let b:statusline_long_line_warning = ""
        "endif
    "endif
    "return b:statusline_long_line_warning
"endfunction

"return a list containing the lengths of the long lines in this buffer
"function! s:LongLines()
    "let threshold = (&tw ? &tw : 80)
    "let spaces = repeat(" ", &ts)

    "let long_line_lens = []

    "let i = 1
    "while i <= line("$")
        "let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        "if len > threshold
            "call add(long_line_lens, len)
        "endif
        "let i += 1
    "endwhile

    "return long_line_lens
"endfunction

"indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" increase/decrease numbers
nnoremap + <C-a>
nnoremap - <C-x>

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default
set foldlevel=99
"set foldcolumn=5

set wildmode=list:longest "make cmdline tab completion similar to bash
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
set listchars=tab:▸\ ,eol:¬,extends:>,precedes:<
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
set nolist

"Toggle line wrap
nmap <leader>w :set wrap!<CR>


" Use the same symbols as TextMate for tabstops and EOLs
" disabling list because it interferes with soft wrap

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

set hidden          " hide buffers instead of closing them

"Activate smartcase
set ic
set smartcase

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

    colorscheme claude
    set guifont=Monospace\ 9
    if has("gui_gnome")
        "set term=gnome-256color
        colorscheme claude
        set guifont=Monospace\ 9
    endif
    if has("gui_mac") || has("gui_macvim")
        colorscheme claude
        set guifont=Monospace\ 9
     endif
    if has("gui_win32") || has("gui_win32s")
        colorscheme claude
        set guifont=Monospace\ 9
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

" PeepOpen uses <Leader>p as well so you will need to redefine it so something
" else in your ~/.vimrc file, such as:
" nmap <silent> <Leader>q <Plug>PeepOpen

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map to CommandT TextMate style finder
nnoremap <leader>t :CommandT<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

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

"disable long lines warning (Claude)
"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
"command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
"function! s:HighlightLongLines(width)
    "let targetWidth = a:width != '' ? a:width : 79
    "if targetWidth > 0
        "exec 'match Todo /\%>' . (targetWidth) . 'v/'
    "else
        "echomsg "Usage: HighlightLongLines [natural number]"
    "endif
"endfunction
":HighlightLongLines

" Strip trailing whitespace - I do not want this for now (Claude)
"function! <SID>StripTrailingWhitespaces()
"" Preparation: save last search, and cursor position.
    "let _s=@/
    "let l = line(".")
    "let c = col(".")
"" Do the business:
    "%s/\s\+$//e
"" Clean up: restore previous search history, and cursor position
    "let @/=_s
    "call cursor(l, c)
"endfunction
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-q> <C-w>c

"key mapping for saving file
nmap <C-s> :w<CR>

"key mapping for tab navigation
nmap <S-Tab> gt
nmap <C-S-Tab> gT

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" when press { + Enter, the {} block will expand.
imap {<CR> {}<ESC>i<CR><ESC>O

" NERDTree settings
nmap wm :NERDTree<cr>
let NERDTreeIgnore=['\.swp$']
nmap <F3> :NERDTreeToggle<CR>

" Taglist
nmap <F4> :TlistToggle<CR>


nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

"if has("balloon_eval")
  "set noballooneval
"endif

" syntastic
"let g:syntastic_debug = 1
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol=">>"
"let g:syntastic_warning_symbol=">>"
""let g:syntastic_error_symbol='✗'
""let g:syntastic_warning_symbol='⚠'
"let g:syntastic_auto_loc_list=1
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_loc_list_height=8

"let g:syntastic_python_checkers=['pylint']
"let g:syntastic_python_checker_args='--ignore=E501,E225'
"let g:syntastic_python_pylint_args="--const-rgx='[a-z_][a-zA-Z0-9_]{0,30}$'"
"let g:syntastic_python_pylint_args="--rcfile=~/.pylintrc -f parseable -r n -i y "
"let g:syntastic_mode_map = { 'mode': 'passive',
                               "\ 'active_filetypes': ['ruby', 'php'],
                               "\ 'passive_filetypes': ['puppet'] }
"let g:syntastic_check_on_wq=0
"nmap <F7> :SyntasticToggleMode<CR>
"nmap <C-F7> :SyntasticCheck<CR>


 "MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplShowBufNumbers = 0
let g:miniBufExplForceSyntaxEnable = 1

noremap <C-TAB>   :MBEbb<CR>
noremap <C-S-TAB> :MBEbf<CR>
noremap <C-J> :MBEbb<CR>
noremap <C-K> :MBEbb<CR>
noremap <C-H> :MBEbf<CR>
noremap <C-J> :MBEbf<CR>

" " omnicomplete
" " from http://vim.wikia.com/wiki/VimTip1386
" set completeopt=longest,menuone,preview
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" " open omni completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            " \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" " open user completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"             \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

"auto omnicomplete while typing - acp plugin
"let g:acp_behaviorKeywordCommand = "\<C-Space\>"

" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen


" display cursor line
set cul

set showmatch

set ruler           " show the cursor position all the time
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file

"set ignorecase      " ignore case when searching
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files

set expandtab

set t_kD=
set t_kb=

" Path/file expansion in colon-mode.
set wildmode=list:longest
set wildchar=<TAB>

"set cpoptions+=$

set tags=~/tags,tags
set mouse=ar
set makeprg=make

"map <F7> :cprevious<CR>
"map <F8> :cnext<CR>
"map <F9> :cclose<CR>
"map <F10> :copen<CR>
"map <F11> :make<CR>

"map <F5> :bprevious<CR>
"map <F6> :bnext<CR>

set wildchar=<TAB>

" remap back from ctag
map <c-[> <c-t>

"map <F2> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
"map <ctrl-F2> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" move the cursor all around
set virtualedit=all

"window split
"vertical Split : Ctrl+w + v
"horizontal Split: Ctrl+w + s
"close current windows: Ctrl+w + q
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" active plugins
filetype plugin on
" abbreviation
":iabbrev epython #!/usr/bin/python

" exit insert mode with jj in addition to <ESC>
inoremap jj <ESC>
inoremap kk <ESC>

" copy/paste from clipboard
vmap <Leader>x "+x
vmap <Leader>c "+y
vmap <Leader>v "+gP
nmap <Leader>v "+gP
