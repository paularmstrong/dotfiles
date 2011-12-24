" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

set nocompatible

" ---------------------------------------------------------------------------
"  Highlight
" ---------------------------------------------------------------------------

set hlsearch " highlight searches
set cursorline " highlight current line
set incsearch " highlight dynamically as pattern is typed
highlight Comment         ctermfg=DarkGrey guifg=#444444
highlight StatusLineNC    ctermfg=Black ctermbg=DarkGrey cterm=bold
highlight StatusLine      ctermbg=Black ctermfg=LightGrey

" ----------------------------------------------------------------------------
"   Highlight Trailing Whitespace
" ----------------------------------------------------------------------------

set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------

set nobackup " do not keep backups after close
set nowritebackup " do not keep a backup while working
set noswapfile " don't keep swp files either
set backupdir=$HOME/.vim/backups " store backups under ~/.vim/backup
set backupcopy=yes " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swaps,~/tmp,. " keep swp files under ~/.vim/swap
set undofile " persisten undo

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set nostartofline " don't jump to the start of line when scrolling
set ruler " show the ruler
set scrolloff=5 " start scrolling 5 lines from bottom
set showmode " always show current mod
set title " show filename in window titlebar
set wrap " wrap text! because i'm not hardcore

" ----------------------------------------------------------------------------
" Text Formatting & Editing
" ----------------------------------------------------------------------------

set autoindent " copy indent from last line when starting new line
set backspace=indent,eol,start
set diffopt=filler " add vertical spaces to keep left/right aligned
set diffopt+=iwhite " ignore whitespace changes
set encoding=utf-8 nobomb " BOM often causes lame problems
set expandtab " expand tabs to spaces
set gdefault " add g flag to search/replace by default (add g to toggle)
set paste " fix autoindent on paste
set shiftwidth=4 " # of spaces for indenting
set smarttab " at start of line, <tab> inserts shiftwidt spaces, <backspace> deletes shiftwidth spaces
set softtabstop=4 " tab key makes 4 spaces
set ttyfast " send more characters at a given time
set ttymouse=xterm " set mouse type to xterm
set tabstop=4

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

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
