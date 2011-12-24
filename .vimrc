" Use Vim defaults (much better!)
set nocompatible

set autoindent " copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " highlight current line
set diffopt=filler " add vertical spaces to keep left/right aligned
set diffopt+=iwhite " ignore whitespace changes
set encoding=utf-8 nobomb " BOM often causes lame problems
set expandtab " expand tabs to spaces
set gdefault " add g flag to search/replace by default (add g to toggle)
set hlsearch " highlight searches
set incsearch " highlight dynamically as pattern is typed
set paste " fix autoindent on paste
set ruler " show the ruler
set scrolloff=5 " start scrolling 5 lines from bottom
set shiftwidth=4 " # of spaces for indenting
set showmode " always show current mod
set smarttab " at start of line, <tab> inserts shiftwidt spaces, <backspace> deletes shiftwidth spaces
set softtabstop=4 " tab key makes 4 spaces
set title " show filename in window titlebar
set ttyfast " send more characters at a given time
set ttymouse=xterm " set mouse type to xterm
set undofile " persisten undo
set tabstop=4
set wrap " wrap text! because i'm not hardcore

" Switch syntax highlighting on
syntax on

" Use my colours
colorscheme shortshell

" Lets colors not be all bold for 8 color terminals
set t_Co=256

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Markdown
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

autocmd BufWritePre * :%s/\s\+$//e
