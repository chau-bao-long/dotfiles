" ==================================================== Plugin Config
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'justinmk/vim-sneak'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-vdebug/vdebug'
Plug 'idanarye/vim-vebugger', {'branch': 'develop'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
Plug 'chrisbra/Colorizer'
Plug 'airblade/vim-rooter'

" Ruby on Rails plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec'

" Javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'isruslan/vim-es6'
Plug 'styled-components/vim-styled-components'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'jason0x43/vim-js-indent'
Plug 'jparise/vim-graphql'
Plug 'Galooshi/vim-import-js'

" PHP Plugins
Plug 'Rican7/php-doc-modded'

call plug#end()

" ==================================================== Config Plugin
source ~/Projects/dotfiles/.vim/config/float-term.vim
source ~/Projects/dotfiles/.vim/config/fzf.vim
source ~/Projects/dotfiles/.vim/config/ctrlfs.vim
source ~/Projects/dotfiles/.vim/config/denite.vim
source ~/Projects/dotfiles/.vim/config/multicursor.vim
source ~/Projects/dotfiles/.vim/config/ale.vim
source ~/Projects/dotfiles/.vim/config/coc.vim
source ~/Projects/dotfiles/.vim/config/session.vim
source ~/Projects/dotfiles/.vim/config/sneak.vim
source ~/Projects/dotfiles/.vim/config/ranger.vim
source ~/Projects/dotfiles/.vim/config/tree.vim
source ~/Projects/dotfiles/.vim/config/git.vim
source ~/Projects/dotfiles/.vim/config/debug.vim

" ==================================================== Minor Plugin Config
nmap <space>iu m0:UltiSnipsEdit<cr>
let g:rainbow_active = 1
nmap <space>ch :ColorHighlight!<cr>
nmap <space>ct :ColorToggle<cr>
let g:rooter_change_directory_for_non_project_files = 'current'

" ==================================================== General Config
filetype plugin indent on

set nocompatible              " be iMproved, required filetype off
" set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set guicursor=n:blinkon1        "Fix bug cursor of COC
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ==================================================== Theme
set background=dark
set termguicolors
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='wombat'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" ==================================================== Highlight
hi Search cterm=NONE ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858
hi DiffAdd cterm=NONE ctermfg=NONE ctermbg=236 guifg=NONE guibg=#303030
hi DiffChange cterm=NONE ctermfg=NONE ctermbg=238 guifg=NONE guibg=#444444
hi DiffDelete cterm=reverse ctermfg=0 ctermbg=88 guibg=#3c1f1e
hi DiffText cterm=NONE ctermfg=NONE ctermbg=23 guifg=NONE guibg=#005f5f
hi Normal guibg=#000000
hi EndOfBuffer guibg=#000000

" ==================================================== Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup
set nowb

" ==================================================== Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ==================================================== Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab ts=2 sw=2 ai

autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype kotlin setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype xml setlocal ts=4 sw=4 sts=0 expandtab

" Auto indent pasted text
nnoremap p p=`]
nnoremap P P=`]

filetype plugin on
filetype indent on

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ==================================================== Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=5       "deepest fold is 5 levels
set nofoldenable        "dont fold by default

" ==================================================== Completion
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ==================================================== Scrolling
set scrolloff=3         "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ==================================================== Search
set incsearch       " Find the next match as we type the search
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set hlsearch
nmap z/ /turn-off-search-highlight<cr>

" ==================================================== Custom mapping
nmap gk :tabprevious<cr>
nmap gj :tabnext<cr>
nmap <space>tt :tabnew<cr><space>wf
nmap <space>vv :vs<cr><C-w>l
nmap <space>xx :split<cr><C-w>j
map <space>wL <C-w>30>
map <space>wH <C-w>30<
map <space>wJ <C-w>25+
map <space>wK <C-w>25-
map <space>w= <C-w>=
nmap <script> <silent> <space>3 :copen 1000<cr>G:ColorHighlight!<cr>
nmap <script> <silent> <space>2 :call ToggleQuickfixList()<cr>
nmap <space>w <c-w>
nmap <space>w<cr> <c-w>r<c-w>h<c-w>60>
nmap 'w :wa!<CR>
nmap 'q :wq<CR>
nmap 'e :q!<CR>
nmap 'r :edit!<cr>
nmap 't :tabclose<cr>
nmap zj <C-d>
nmap zk <C-u>
nmap zh <C-e><C-e><C-e><C-e><C-e>jjjjj
nmap zl <C-y><C-y><C-y><C-y><C-y>kkkkk
nmap <C-j> <C-d>
nmap <C-k> <C-u>
nmap <C-h> <C-e><C-e><C-e><C-e><C-e>jjj
nmap <C-l> <C-y><C-y><C-y><C-y><C-y>kkk
nmap zi <C-i>
nmap zo <C-o>
nmap co :let @+=expand("%:t")<cr>
nmap cl :let @+=expand("%:t")<cr>:Dispatch! osascript ~/Projects/dotfiles/mac_scripts/intelliJ.scpt<cr>
nmap cO :let @+=expand("%:p")[-32:]<cr>
nmap cy :let @+=expand("%:p")<cr>
nmap ch :let @+=expand("%:h")<cr>
nmap cu viwcp
nmap c' vi'cp
nmap c" vi"cp
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<cr>
nmap <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<cr>
nmap gv :vs<cr><c-w>lgd
nmap gV :vs<cr><c-w>lgf
nmap gs :sp<cr><c-w>lgd
nmap gS :sp<cr><c-w>lgf
nmap gt :tabnew<cr>zogd
nmap gT :tabnew<cr>zogf

" Better copy/paste behavior
set pastetoggle=<space>4
xnoremap p "_dP

" Miscellaneous
map <space>cl :ts<CR>
map <space>c] :tn<CR>
map <space>c[ :tp<CR>
imap zbt <Esc>a``<Esc>i
imap zbs <Esc>a```<Esc>i
nmap <space>cb :bufdo bd<CR>
nmap <space>8 :pwd<CR>
nmap <space>7 :call common#goToCurrentFile()<CR>
nmap <space>9 :call common#goBack()<CR>
nmap <space>0 :call common#goBackToRoot()<CR>
nmap g- :tabm -1<CR>
nmap g= :tabm +1<CR>
vmap / y:/<C-R>0<CR>
nmap <space>e= 15kV30j=15j
nmap <space>er :e<cr>
nmap <space>tm <c-w>T
nmap <space>eq yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0<cr>
nmap <space>eQ yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0 && read<cr>
vmap <space>eq y:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0<cr>
vmap <space>eQ y:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0 && read<cr>
nmap <space>ew :Dispatch ~/bin/current-cmd<cr>
nmap <space>eW :Dispatch ~/bin/current-cmd && read<cr>

" Common functions
nnoremap zp :call common#gotoJump()<cr>
nnoremap <space>ot :call common#openFilesFromClipboard("tabnew")<cr>
nnoremap <space>oo :call common#openFilesFromClipboard("e")<cr>
nnoremap <space>os :call common#openFilesFromClipboard("split")<cr>
nnoremap <space>ov :call common#openFilesFromClipboard("vs")<cr>
