" Vim color file
" Original Maintainer:  Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  2010-07-23
"
" Modified version of wombat for 256-color terminals by
"   David Liang (bmdavll@gmail.com)
" based on version by
"   Danila Bespalov (danila.bespalov@gmail.com)

" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60

let s:base03      = "#002b36"
let s:base02      = "#073642"
let s:base01      = "#586e75"
let s:base00      = "#657b83"
let s:base0       = "#839496"
let s:base1       = "#93a1a1"
let s:base2       = "#eee8d5"
let s:base3       = "#fdf6e3"
let s:yellow      = "#b58900"
let s:orange      = "#cb4b16"
let s:red         = "#dc322f"
let s:magenta     = "#d33682"
let s:violet      = "#6c71c4"
let s:blue        = "#268bd2"
let s:cyan        = "#2aa198"
"let s:green       = "#859900" "original
let s:green       = "#719e07" "experimental


set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "claude"

" xterm color range
" 00 5f 87 af d7 ff

" General colors
hi Normal		ctermfg=252		ctermbg=234		cterm=NONE		guifg=#e3e0d7	guibg=#242424	gui=NONE
hi Cursor		ctermfg=234		ctermbg=228		cterm=NONE		guifg=#ffffff		guibg=#8888aa	gui=NONE
"hi Cursor		ctermfg=234		ctermbg=228		cterm=NONE		guifg=#242424	guibg=#cccccc	gui=NONE
hi Visual		ctermfg=251		ctermbg=239		cterm=NONE		guifg=NONE		guibg=#445577	gui=NONE
hi VisualNOS	ctermfg=251		ctermbg=236		cterm=NONE		guifg=#c3c6ca	guibg=#303030	gui=NONE
hi Search		ctermfg=177		ctermbg=241		cterm=NONE		guifg=NONE		guibg=#606060	gui=NONE
hi IncSearch	ctermfg=177		ctermbg=241		cterm=NONE		guifg=NONE		guibg=#909090	gui=bold
"hi Search		ctermfg=177		ctermbg=241		cterm=NONE		guifg=#d787ff	guibg=#636066	gui=NONE
hi Folded		ctermfg=103		ctermbg=237		cterm=NONE		guifg=#a0a8b0	guibg=#3a4046	gui=NONE
hi Title		ctermfg=230		ctermbg=238		cterm=bold		guifg=#ffffd7   guibg=NONE		gui=bold
hi StatusLine	ctermfg=230		ctermbg=238		cterm=NONE		guifg=#ffffd7	guibg=#444444	gui=italic
hi VertSplit	ctermfg=238		ctermbg=238		cterm=NONE		guifg=#444444	guibg=#444444	gui=NONE
hi StatusLineNC	ctermfg=241		ctermbg=238		cterm=NONE		guifg=#857b6f	guibg=#444444	gui=NONE
hi LineNr		ctermfg=241		ctermbg=232		cterm=NONE		guifg=#857b6f	guibg=#181818	gui=NONE
hi WarningMsg	ctermfg=203		ctermbg=237		cterm=bold		guifg=#ff5f55	guibg=NONE		gui=NONE
hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold		guifg=#ff2026	guibg=#3a3a3a	gui=bold

" tabs and end of line special characters
hi SpecialKey	ctermfg=241		cterm=NONE		guifg=#505050	guibg=NONE	gui=NONE
hi NonText		ctermfg=241		cterm=NONE		guifg=#505050	guibg=NONE	gui=NONE

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine					ctermbg=236		cterm=NONE		guibg=NONE		guibg=#282828	gui=NONE
hi MatchParen	ctermfg=228		ctermbg=101		cterm=bold		guifg=#eae788	guibg=#857b6f	gui=bold
hi Pmenu		ctermfg=230		ctermbg=238		cterm=bold		guifg=#ffffd7	guibg=#444444	gui=NONE
hi PmenuSel		ctermfg=232		ctermbg=192		cterm=bold		guifg=#080808	guibg=#cae982	gui=NONE
endif

" Diff highlighting
hi DiffAdd						ctermbg=17										guibg=#2a0d6a
hi DiffDelete	ctermfg=234		ctermbg=60		cterm=NONE		guifg=#242424	guibg=#3e3969	gui=NONE
hi DiffText						ctermbg=53		cterm=NONE						guibg=#73186e	gui=NONE
hi DiffChange					ctermbg=237										guibg=#382a37

"hi CursorIM
"hi Directory
"hi IncSearch
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar
"hi SignColumn
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu


" Syntax highlighting
hi Keyword		ctermfg=111		cterm=NONE		guifg=#88b8f6	gui=NONE
hi Statement	ctermfg=111		cterm=NONE		guifg=#88b8f6	gui=NONE
hi Constant		ctermfg=173		cterm=NONE		guifg=#e5786d	gui=NONE
hi Number		ctermfg=173		cterm=NONE		guifg=#e5786d	gui=NONE
hi PreProc		ctermfg=173		cterm=NONE		guifg=#e5786d	gui=NONE
hi Function		ctermfg=192		cterm=NONE		guifg=#cae982	gui=NONE
hi Identifier	ctermfg=192		cterm=NONE		guifg=#cae982	gui=NONE
hi Type			ctermfg=186		cterm=NONE		guifg=#d4d987	gui=NONE
hi Special		ctermfg=229		cterm=NONE		guifg=#eadead	gui=NONE
hi Comment		ctermfg=00875f	cterm=italic   	guifg=#95e454	gui=italic
hi String		ctermfg=244		cterm=NONE		guifg=#9c998e	gui=NONE
hi Todo			ctermfg=101		cterm=NONE		guifg=#857b6f	gui=italic


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine
"hi! link NonText		LineNr

"MiniBufExpl
hi MBENormal               ctermfg=232	ctermbg=192	cterm=bold	guifg=#808080 guibg=#88ff00		gui=NONE
hi MBEChanged              ctermfg=232	ctermbg=192	cterm=bold	guifg=#808080 guibg=#ff8800		gui=bold
hi MBEVisibleNormal        ctermfg=232	ctermbg=192	cterm=bold	guifg=#ffffff guibg=#444444		gui=NONE
hi MBEVisibleChanged       ctermfg=232	ctermbg=192	cterm=bold	guifg=#888888 guibg=#ff4444		gui=bold
hi MBEVisibleActiveNormal  ctermfg=232	ctermbg=192	cterm=bold	guifg=#ffffff guibg=#00f000		gui=NONE
hi MBEVisibleActiveChanged ctermfg=232	ctermbg=192	cterm=bold	guifg=#ffffff guibg=#f00000		gui=bold



	




	




" vim:set ts=4 sw=4 noet:
