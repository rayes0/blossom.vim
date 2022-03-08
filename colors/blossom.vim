" Vim Theme: Blossom
" Author: rayes <www.github.com/rayes0>
" URL: https://www.github.com/rayes0/blossom.vim

" Exit if terminal doesn't support 256 colors
"if !(has('termguicolors') && &termguicolors) || has('gui_running')
"	echoerr "ERROR: blossom.vim requires a true color terminal"
"	finish
"endif

hi clear
if exists('syntax_on')
	syntax reset
endif
set background=light

let g:colors_name = 'blossom'

" XXX
" ============== Colors ===============
" DEFAULT BG: #ede6e3 - lightneess=91.8 - bg_def
" Soft BG: #dad3d0 - lightness=85.0 - bg_soft

" Neutral Light BG: #b6a8a2 - Lightness=70.0 - bg_neutral

" Hard Colored BG: #e3d0cb - bg_hardcol
" Soft Colored BG: #e6dad6 - bg_softcol

" DEFAULT FG: #685c56 - Lightness=40.0 - fg_def
" Dark FG: #574b45 - Lightness=33.0 - fg_dark
" Light FG: #938680 - Lightness=57.0 - fg_light

" Pinkish Light FG: #8f8678 - fg_pink

" Don't overuse these
" Syntax1: #cc6652 - syn_red
" Syntax2: #995c8c - syn_magenta
" Syntax3: #407680 - syn_cyan

" Red BG: #fccec1 - bg_red
"
" These two hvae the same L and C value, just the hue is changed but the green
" will appear brighter because it contrasts with the background more. This is
" a good thing as these are only used for diffs
" Yellow BG: #fbf1be - bg_yellow
" Green BG: #cefbbe - bg_green
"

let s:bg_def = ['#ede6e3', '254']
let s:bg_soft = ['#dad3d0', '252']
let s:bg_neutral = ['#b6a8a2', '248']
let s:bg_hardcol = ['#e3d0cb', '188']
let s:bg_softcol = ['#e6dad6', '253']
let s:fg_def = ['#685c56', '240']
let s:fg_dark = ['#574b45', '239']
let s:fg_light = ['#938680', '102']
let s:fg_pink = ['#8f8678', '102']
let s:bg_red = ['#fccec1', '217']
let s:bg_yellow = ['#fbf1be', '230']
let s:bg_green = ['#cefbbe', '194']

let s:syn_red = ['#9e552f', '131']
let s:syn_magenta = ['#995c8c', '96']
let s:syn_cyan = ['#407680', '66']

if has("nvim")
	let g:terminal_color_0 =  "#ede6e3"
	let g:terminal_color_8 =  "#ede6e3"
	let g:terminal_color_1 =  "#3A3A3A"
	let g:terminal_color_9 =  "#3A3A3A"
	let g:terminal_color_2 =  "#637A8A"
	let g:terminal_color_10 = "#637A8A"
	let g:terminal_color_3 =  "#AA8F7C"
	let g:terminal_color_11 = "#AA8F7C"
	let g:terminal_color_4 =  "#8B8F7E"
	let g:terminal_color_12 = "#8B8F7E"
	let g:terminal_color_5 =  "#877979"
	let g:terminal_color_13 = "#877979"
	let g:terminal_color_6 =  "#937F74"
	let g:terminal_color_14 = "#937F74"
	let g:terminal_color_7 =  "#685c56"
	let g:terminal_color_15 = "#685c56"
	let g:terminal_color_background = g:terminal_color_0
	let g:terminal_color_foreground = g:terminal_color_7
endif


" Highlighting function
if (has('termguicolors') && &termguicolors) || has('gui_running')
	function! s:hl(group, fg, bg, attr, sp)
		if type(a:fg) == v:t_list
			exec "hi " . a:group . " guifg=" . a:fg[0]
		else
			exec "hi " . a:group . " guifg=" . a:fg
		endif

		if type(a:bg) == v:t_list
			exec "hi " . a:group . " guibg=" . a:bg[0]
		else
			exec "hi " . a:group . " guibg=" . a:bg
		endif
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		exec "hi " . a:group . " guisp=" . a:sp
	endfunction
else
	function! s:hl(group, fg, bg, attr, sp)
		if type(a:fg) == v:t_list
			exec "hi " . a:group . " ctermfg=" . a:fg[1]
		else
			exec "hi " . a:group . " ctermfg=" . a:fg
		endif
		if type(a:bg) == v:t_list
			exec "hi " . a:group . " ctermbg=" . a:bg[1]
		else
			exec "hi " . a:group . " ctermbg=" . a:bg
		endif
		exec "hi " . a:group . " cterm=" . a:attr
	endfunction
endif

" XXX
" ======== Highlighting ======== "
" call s:hl(group, fg, bg, attr, guisp)

" ----- Basic ------
call s:hl("Normal", s:fg_def, s:bg_def, "NONE", "NONE")

call s:hl("Cursor", s:bg_def, s:fg_def, "NONE", "NONE")
call s:hl("CursorLineNr", s:fg_dark, s:bg_def, "NONE", "NONE")
call s:hl("CursorLine", s:fg_dark, s:bg_def, "NONE", "NONE")
hi! link CursorIM Cursor
hi! link lCursor Cursor
hi! link TermCursor Cursor
hi! TermCursorNC guifg=bg guibg=#544953

call s:hl("ColorColumn", "NONE", s:bg_soft, "NONE", "NONE")
call s:hl("SignColumn", s:bg_neutral, "NONE", "NONE", "NONE")
call s:hl("LineNr", s:bg_neutral, "NONE", "NONE", "NONE")

" ----- Status Lines -----
call s:hl("StatusLine", s:fg_def, s:bg_hardcol, "bold,italic", "NONE")
call s:hl("StatusLineNC", s:fg_def, s:bg_softcol, "italic", "NONE")
" call s:hl("WildMenu
call s:hl("TabLine", s:fg_light, s:bg_soft, "italic", "NONE")
"call s:hl("TabLineSel", s:fg_dark, s:bg_hardcol, "bold,italic", "NONE")
call s:hl("TabLineSel", s:fg_dark, "NONE", "bold,italic", "NONE")
hi! link Title TabLineSel
hi! link TabLineFill TabLine

" ----- Completion Menu ------
call s:hl("Pmenu", "NONE", s:bg_softcol, "NONE", "NONE")
call s:hl("PmenuThumb", "NONE", s:fg_def, "NONE", "NONE")
call s:hl("PmenuSel", s:bg_def, s:fg_light, "NONE", "NONE")
hi! link PmenuSbar PMenu

" ----- Editor Colors ------
call s:hl("Folded", s:fg_light, "NONE", "italic", "NONE")
hi! link FoldColumn Folded

call s:hl("Directory", "NONE", "NONE", "italic", "NONE")
call s:hl("VertSplit", s:bg_neutral, s:bg_def, "NONE", "NONE")
call s:hl("Conceal", "NONE", "NONE", "NONE", "NONE")
call s:hl("MatchParen", "NONE", s:bg_soft, "underline,bold", "NONE")
hi! link ErrorMsg Error
hi! link EndOfBuffer LineNr
hi! link NonText Whitespace
"hi! link ModeMsg Normal
call s:hl("ModeMsg", "NONE", "NONE", "italic,bold", "NONE")
hi! link MoreMsg ModeMsg
hi! link MsgArea Normal
hi! link MsgSeparator Normal

hi! link NormalFloat Pmenu
hi! link NormalNC Normal

call s:hl("WarningMsg", s:fg_def, s:bg_red, "italic,underline", "NONE")
call s:hl("Whitespace", s:bg_soft, "NONE", "NONE", "NONE")
hi! link SpecialKey Whitespace
hi! link Visual Search
hi! link VisualNOS Visual
hi! link Question Normal
hi! link EndOfBuffer Normal

" ----- Diff ------
call s:hl("DiffAdd", s:fg_dark, s:bg_green, "NONE", "NONE")
call s:hl("DiffDelete", s:fg_dark, s:bg_red, "italic", "NONE")
call s:hl("DiffChange", s:fg_dark, s:bg_softcol, "NONE", "NONE")
call s:hl("DiffText", s:fg_dark, s:bg_yellow, "bold", "NONE")
call s:hl("diffNewFile" ,s:syn_cyan, "NONE", "italic", "NONE")
call s:hl("diffFile" ,s:syn_cyan, "NONE", "italic", "NONE")

hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link diffChanged DiffChange
hi! link diffComment Comment

" ----- Spellcheck -----
hi! link SpellBad ErrorMsg
call s:hl("SpellCap", "NONE", "NONE", "underline", "NONE")
hi! link SpellLocal SpellCap
hi! link SpellRare SpellCap

" ----- Search, Visual, etc. ------
call s:hl("Search", "NONE", s:bg_yellow, "NONE", "NONE")
call s:hl("IncSearch", s:bg_def, s:syn_cyan, "bold", "NONE")
hi! link Substitute IncSearch

" XXX
" ============== Syntax ===============
" ===== Base Groups =====
call s:hl("Comment", s:fg_pink, "NONE", "italic", "NONE")
call s:hl("Identifier", s:syn_red, "NONE", "italic", "NONE")
call s:hl("Type", s:fg_def, "NONE", "italic", "NONE")
call s:hl("Special", s:fg_dark, "NONE", "NONE", "NONE")
call s:hl("Underlined", s:fg_def, "NONE", "underline", "NONE")
call s:hl("Error", s:fg_def, s:bg_red, "NONE", "NONE")
hi! link Todo WarningMsg
hi! link Ignore Conceal

"call s:hl("Statement", s:syn_magenta, "NONE", "italic", "NONE")
call s:hl("Statement", s:syn_magenta, "NONE", "NONE", "NONE")
call s:hl("Operator", s:syn_magenta, "NONE", "NONE", "NONE")
call s:hl("Keyword", "NONE", "NONE", "italic", "NONE")

call s:hl("PreProc", s:syn_cyan, "NONE", "italic", "NONE")
call s:hl("Macro", s:syn_cyan, "NONE", "NONE", "NONE")

call s:hl("Constant", s:fg_dark, "NONE", "NONE", "NONE")
" call s:hl("String", s:fg_dark, "NONE", "italic", "NONE")
call s:hl("Boolean", s:syn_magenta, "NONE", "italic", "NONE")

" ===== Specific Groups =====
" XXX
" ----- General Info -----
" Try to use these whenever possible. Prefer italic over bold.
" Braces: link to default
call s:hl("lightBraces", s:fg_def, "NONE", "NONE", "NONE")
" Use For Special Constants: (eg:color names)
call s:hl("specialCons", s:fg_dark, "NONE", "italic", "NONE")
"  Use For Special Names: (eg:class names)
call s:hl("specialNm", s:syn_magenta, "NONE", "italic", "NONE")
" Labels: link to "Type: (default color, just italicized)
" Function Names: link to "Preproc: (cyan color) for 'special' ones, "Identifier: (red
" color) for other ones
" TabLlineSel Override: use for headers to override TabLineSel
call s:hl("overrideHeader", s:fg_def, "NONE", "italic,bold", "NONE")
" 
" XXX

" ----- Markdown -----
call s:hl("mkdHeading", "NONE", "NONE", "italic,bold", "NONE")
hi! link markdownH1 mkdHeading
hi! link markdownH2 mkdHeading
hi! link markdownH3 mkdHeading
hi! link markdownH4 mkdHeading
hi! link markdownH5 mkdHeading
hi! link markdownH6 mkdHeading
call s:hl("markdownHeadingDelimiter", s:syn_magenta, "NONE", "bold", "NONE")

call s:hl("markdownCode", s:fg_light, "NONE", "italic", "NONE")
hi! link markdownCodeDelimiter Folded
call s:hl("markdownBold", "NONE", "NONE", "bold", "NONE")
hi! link markdownBoldDelimiter Folded
call s:hl("markdownItalic", "NONE", "NONE", "italic", "NONE")
hi! link markdownItalicDelimiter Folded
call s:hl("markdownBoldItalic", "NONE", "NONE", "italic,bold", "NONE")
hi! link markdownBoldItalicDelimiter Folded
call s:hl("markdownUrl", "NONE", "NONE", "underline", "NONE")
hi! link markdownLinkDelimiter Folded
hi! link markdownLinkDelimiter Folded
call s:hl("markdownLinkText", "NONE", "NONE", "italic", "NONE")
hi! link markdownLinkTextDelimiter Folded

" ----- Pandoc -----
" Make pandoc similar to markdown
hi! link pandocEmphasis markdownItalic
hi! link pandocStrong markdownBold
hi! link pandocEmphasisInStrong markdownBoldItalic
" hi! pandocEmphasisInStrong guifg=NONE guibg=NONE guisp=NONE gui=italic,bold
hi! link pandocAtxHeader mkdHeading
hi! link pandocAtxStart markdownHeadingDelimiter

hi! link pandocSetexHeader overrideHeader

" ----- Html -----
" Have to include this otherwise it will be highlighted with TabLineSel for some reason
hi! link htmlTitle mkdHeading
hi! link htmlH1 mkdHeading
hi! link htmlH2 mkdHeading
hi! link htmlH3 mkdHeading
hi! link htmlH4 mkdHeading
hi! link htmlH5 mkdHeading
hi! link htmlH6 mkdHeading

hi! link htmlLink markdownUrl
hi! link htmlScriptTag Preproc
hi! link htmlSpecialTagName Preproc

" ----- XML -----
" Make similar to html
hi! link xmlTagName Statement
hi! link xmlEndTag Statement
hi! link xmlEqual Identifier

" ----- css -----
hi! link cssBraces lightBraces
hi! link cssColor specialCons
hi! link cssTagName specialNM
hi! link cssClassName specialNM
hi! link cssImportant Preproc

hi! link sassClass cssClassName
hi! link sassClassChar cssClassNameDot

" ----- Javascript -----
hi! link javascriptBraces Normal

" ----- AsciiDoc -----
hi! link asciidocTwoLineTitle overrideHeader
call s:hl("asciidocTwoTitleUnderline", s:syn_red, "NONE", "italic,bold", "NONE")

" ----- sh -----
" Remove italics from some stuff
call s:hl("shTestopr", s:syn_magenta, "NONE", "NONE", "NONE")

" ----- Plugins ------ XXX

" ----- NERDTree -----
call s:hl("NERDTreeCWD", s:fg_def, "NONE", "italic,bold,underline", "NONE")
hi! link NERDTreeDir Directory
call s:hl("NERDTreeDirSlash", s:fg_light, "NONE", "NONE", "NONE")
call s:hl("NERDTreeExecFile", s:fg_def, "NONE", "italic", "NONE")
call s:hl("NERDTreeHelp", s:fg_light, "NONE", "italic", "NONE")
call s:hl("NERDTreeOpenable", s:fg_light, "NONE", "italic", "NONE")
call s:hl("NERDTreeCloseable", s:fg_light, "NONE", "italic", "NONE")

" ----- Taglist ----- "
call s:hl("TagListFileName", s:fg_def, "NONE", "italic,bold,underline", "NONE")
call s:hl("TagListTitle", s:fg_def, "NONE", "italic,bold", "NONE")
