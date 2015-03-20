execute pathogen#infect()
syntax on
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0

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

" Enable mouse support (n,v,i,c or a)
"set mouse=a

"Clean up whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e
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

" Mappings
let mapleader=","

" navigate buffers
nmap <C-m> :bnext<CR>
nmap <C-b> :bprev<CR>
nmap <C-x> :bd<CR>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <Leader>t :w<CR>:!bundle exec rspec<CR>

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" set correct syntax highlighting for markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" run tests with Dispatch
nnoremap <F9> :w<CR>:Dispatch bundle exec rspec %<CR>

