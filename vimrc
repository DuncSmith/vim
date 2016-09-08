" Various bits inspired/stolen/borrowed from:
" github.com/mislav/vimfiles
" github.com/seenmyfate/vim
" vim.wikia.com
" http://dougblack.io/words/a-good-vimrc.html
" https://github.com/mhinz/vim-galore

" =LAUNCH CONFIG= {{{
set encoding=utf8                                   " Set utf8 as sane standard encoding
set ffs=unix,dos,mac                                " Use Unix as the standard file type
set clipboard=unnamed                               " use OS clipboard
set nocompatible                                    " select no compatibility with legacy vi
set modelines=1                                     " check for per file vim config lines
" }}}
" =VIM-PLUG= {{{
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-buftabline'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'css'] }
Plug 'christoomey/vim-tmux-navigator'
Plug 'conradIrwin/vim-bracketed-paste'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'msanders/snipmate.vim'
Plug 'mtth/scratch.vim'
Plug 'rking/ag.vim'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki'

call plug#end()
" }}}
" =COLOURS= {{{
syntax on
set background=dark
colorscheme solarized
" }}}
" =SPACES AND TABS= {{{
set expandtab                                       " Use spaces instead of tabs
set shiftwidth=2 tabstop=2                          " a tab is 2 spaces
set softtabstop=2                                   " number of spaces in tab when editing
" }}}
" =UI CONFIG= {{{
set number                                          " show line numbers
set showcmd                                         " display incomplete commands
"set cursorline                                      " Highlight current line - Causes performance issues in large files
set scrolloff=999                                   " Keep cursor centered
set colorcolumn=80                                  " highlight at 80 characters
filetype plugin indent on                           " load filetype-specific indent files
set wildmenu                                        " visual autocomplete for command menu
set ai                                              " Auto indent
set si                                              " Smart indent
set wrap                                            " Wrap lines
set linebreak tw=500                                " Linebreak on 500 characters
set cmdheight=2                                     " number of lines for the cmd line
set laststatus=2                                    " always have a status line
set list                                            " turn on invisible characters
set listchars=tab:▸\ ,trail:-                       " which chars to highlight
highlight NonText guifg=#444444
highlight SpecialKey guifg=#444444
" }}}
" =SEARCHING= {{{
set hlsearch                                        " highlight matches
set incsearch                                       " incremental searching
set ignorecase                                      " searches are case insensitive...
set smartcase                                       " ... unless they contain at least one capital letter

" clear the search buffer
nnoremap <CR> :nohlsearch<cr>
" }}}
" =FOLDING= {{{
set foldenable                                      " enable folding
set foldlevelstart=10                               " open most folds by default
set foldnestmax=10                                  " 10 nested fold max

" space open/closes folds
nnoremap <space> za
set foldmethod=indent                               " fold based on indent level
" }}}
" =MOVEMENT= {{{
" easier navigation between split windows
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

" Use Arrow keys for navigating tabs and buffers
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> :tabnext<CR>
nnoremap <Down> :tabprevious<CR>

" no movement in insert mode thanks
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Enable Mouse
set mouse=n

" navigate buffers
nnoremap <C-b> :bnext<CR>
nnoremap <C-x> :bd<CR>
" }}}
" =LEADER SHORTCUTS= {{{
let mapleader=","                                   " leader key

" re-indent file
nnoremap <leader>i gg=G

" Rails gf (goto file)
map <leader>f <c-w>f

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>et :vsp ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" vim-plug shortcuts
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pg :PlugUpgrade<CR>
nnoremap <leader>ps :PlugStatus<CR>

" Search with Ag.vim
nnoremap <leader>/ :Ag<space>

" Convert ruby 1.8 hashes to 1.9 style, whole document
nnoremap <leader>pp :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Scratch window
nnoremap <leader>sc :Scratch<CR>
" }}}
" =AUTOGROUPS= {{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " correct syntax markdown files

" Spell Checking, ]s and  [s to jump, z= to select alternatives
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
autocmd BufRead,BufNewFile *.wiki setlocal spell spelllang=en_gb
autocmd FileType gitcommit setlocal spell spelllang=en_gb

" }}}
" =BACKUPS= {{{
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Store temporary files in a central spot
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" }}}
" =TMUX= {{{
" allow cursor change in tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" =CUSTOM MAPPINGS= {{{
" hamfisted save
nnoremap <F8> :w<CR>

"Ctrl-p mapped to FZF Files function
nnoremap <c-p> :Files<CR>
" }}}
" ====PLUGINS====
" =EASYMOTION= {{{
" Bi-directional find motion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" }}}
" =LIGHTLINE= {{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'right': [ [ 'percent', 'lineinfo' ], [ 'fugitive' ], [ 'path' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'path': 'Path',
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ }

function LightLineFugitive()
  return exists('*fugitive#head') ? 'Git('.fugitive#head().')' : ''
endfunction

function Path()
  return fnamemodify(expand('%:p:h'), ':~:.')
endfunction
" }}}
" =NERDTREE= {{{
map <C-n> :NERDTreeToggle<CR>
nmap <silent> <Leader>b :TagbarToggle<CR>

" }}}
" =DISPATCH= {{{
nnoremap <F9> :w<CR>:Dispatch bundle exec rspec %<CR>
nnoremap <F10> :w<CR>:Dispatch RUBYOPT=W0 bundle exec spec %<CR>
" }}}
" =RSPEC= {{{
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = '!bundle exec rspec --color {spec}'
" }}}
" =CTAGS= {{{
" navigate with <c-]> / <c-t>
map <Leader>ct :!ctags --exclude=public --exclude=spec --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>
map <C-'> :tprev<CR>
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"      " exclude javascript files
" }}}
" =SYNTASTIC= {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" vim:foldmethod=marker:foldlevel=0
