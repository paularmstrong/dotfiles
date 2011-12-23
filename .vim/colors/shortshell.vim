" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Modified from murphy.vim by Ron Aaron <ron@ronware.org>
" Last Change:	refer to file stats

hi clear
"set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shortshell"

hi zKeyword                    ctermfg=Green

hi Normal					   ctermfg=White guibg=Black		 guifg=lightgreen
hi Comment					   ctermfg=DarkGray guifg=Orange
hi Constant		term=underline ctermfg=Cyan guifg=White	gui=NONE
hi Identifier	term=underline ctermfg=Yellow  guifg=#00ffff
hi Ignore					   ctermfg=black	  guifg=bg
hi PreProc		term=underline ctermfg=Cyan  guifg=Wheat
hi Search		term=reverse   ctermfg=Black ctermbg=Yellow					  guifg=white	guibg=Blue
hi Special		term=bold	   ctermfg=White   guifg=magenta
hi Statement	term=bold	   ctermfg=Brown	  guifg=#ffff00 gui=NONE
hi Type						   ctermfg=Magenta guifg=grey	gui=none
hi Error		term=reverse   ctermbg=Red	  ctermfg=White guibg=Red  guifg=White
hi Todo			term=standout  ctermbg=Green ctermfg=Black guifg=Blue guibg=Yellow
" From the source:
hi Cursor										  guifg=Orchid	guibg=fg
hi Directory	term=bold	   ctermfg=Cyan  guifg=Cyan
hi ErrorMsg		term=standout  ctermbg=Red	  ctermfg=White guibg=Red guifg=White
hi IncSearch	term=reverse   cterm=reverse	  gui=reverse
hi LineNr		term=underline ctermfg=Yellow					guifg=Yellow
hi ModeMsg		term=bold	   cterm=bold		  gui=bold
hi MoreMsg		term=bold	   ctermfg=Green gui=bold		guifg=SeaGreen
hi NonText		term=bold	   ctermfg=Blue		  gui=bold		guifg=Blue
hi Question		term=standout  ctermfg=Green gui=bold		guifg=Cyan
hi SpecialKey	term=bold	   ctermfg=Blue  guifg=Cyan
hi StatusLine	term=reverse,bold cterm=reverse   gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=#333333
hi Title		term=bold	   ctermfg=LightMagenta gui=bold	guifg=Pink
hi WarningMsg	term=standout  ctermfg=LightRed   guifg=Red
hi Visual		term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=darkgreen
