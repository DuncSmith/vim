execute pathogen#infect()
syntax on
filetype plugin indent on

let g:airline_powerline_fonts = 1

" Colours etc
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500
set number

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" NERDTRee shortcut
map <C-n> :NERDTreeToggle<CR>

" CTags
" navigate with <c-]> / <c-t>
map <Leader>ct :!ctags --exclude=public --exclude=spec --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>
map <C-'> :tprev<CR>
" exclude javascript files
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
