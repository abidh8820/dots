" show matching brackets/parenthesis
set showmatch
set matchtime=3

" disable startup message
set shortmess+=I

" hide buffers, not close them
set hidden

" colorscheme
color term

" syntax highlighting
syntax on
set synmaxcol=512
filetype plugin indent on

" autocompletion menu
set pumheight=10

" Statusline
set laststatus=2
set noruler
set showcmd
set noshowmode

" no folding
"set nofoldenable
"set foldlevel=99
"set foldminlines=99
"set foldlevelstart=99

" line wrapping
set wrap

" show line numbers
set number relativenumber
set numberwidth=1

" show invisibles
set list
set listchars=
set listchars+=tab:·\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" highlight current line
augroup CursorLine
	au!
	"au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" split style
set fillchars=vert:▒

" tree style file explorer
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25