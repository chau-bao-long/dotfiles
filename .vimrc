" ==================================================== Plugin Config
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'milkypostman/vim-togglelist'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-clap'

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [ "~/Projects/dotfiles/.vim/UltiSnips/" ]
let g:UltiSnipsEditSplit = 'tabdo'
nmap <space>iu :UltiSnipsEdit<cr>

Plug 'honza/vim-snippets'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'justinmk/vim-sneak'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'vim-vdebug/vdebug'
Plug 'idanarye/vim-vebugger', {'branch': 'develop'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'

Plug 'jaxbot/semantic-highlight.vim'
let g:semanticGUIColors = ['#bd93f9', '#ff5555', '#6272a4', '#8be9fd', '#50fa7b', '#ffb86c', '#ff79c6', '#f1fa8c', '#91C9C4','#C2DD8E', '#F7C871', '#91D4EF', '#E3747A', '#E98C6E','#E65A65', '#F44336', '#EF5350', '#EC407A', '#E91E63', '#AB47BC', '#7E57C2', '#5C6BC0', '#3F51B5', '#64B5F6', '#2196F3', '#4FC3F7', '#29B6F6', '#4DD0E1', '#26C6DA', '#81C784', "#EDD528", "#FA6BB2", "#47F2D4", "#F47F86", "#2ED8FF", "#B8E01C", "#C5A127", "#D386F1", "#97DFD6", "#EF874A", "#48EDF0", "#C0AE50", "#89AAB6", "#D7D1EB", "#57F0AC", "#8BE289", "#D38AC6", "#C8EE63", "#ED9C36", "#9DEA74", "#40B7E5", "#EEA3C2", "#7CE9B6", "#8CEC58", "#D8A66C", "#51C03B", "#C4CE64", "#45E648", "#63A5F3", "#EA8C66", "#D2D43E",  "#E4B7CB", "#B092F4", "#44C58C", "#D1E998", "#76E4F2", "#E19392", "#A8E5A4", "#BF9FD6", "#E8C25B", "#58F596", "#6BAEAC","#7EF1DB", "#E8D65C", "#A7EA38", "#D38AE0", "#ECF453", "#5CD8B8", "#B6BF6B", "#BEE1F1", "#B1D43E", "#EBE77B", "#84A5CD", "#CFEF7A", "#A3C557", "#E4BB34", "#ECB151", "#BDC9F2", "#5EB0E9", "#E09764", "#9BE3C8", "#B3ADDC", "#B2AC36", "#C8CD4F", '#93a1a1', '#8a8a8a', '#e4e4e4', '#fdf6e3',  '#cb4b16', '#d33682', '#5f5faf','#d75f00', '#268bd2', '#0087ff', '#2aa198', '#00afaf']
nnoremap <Leader>s :SemanticHighlightToggle<cr>

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'chrisbra/Colorizer'
nmap <space>ch :ColorHighlight!<cr>
nmap <space>ct :ColorToggle<cr>

Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_manual_only = 1
nnoremap <space>cr :Rooter<cr>

Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

Plug 'pechorin/any-jump.vim'
nnoremap <space>jk :AnyJump<CR>
nnoremap <space>jl :AnyJumpLastResults<CR>
xnoremap <space>jc :AnyJumpVisual<CR>

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
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'isruslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'jason0x43/vim-js-indent'
Plug 'jparise/vim-graphql'
Plug 'Galooshi/vim-import-js'
Plug 'Rican7/php-doc-modded'

Plug 'rizzatti/dash.vim'
nnoremap <space>df :Dash<cr>
vnoremap <space>df y:Dash <c-r>0<cr>

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
source ~/Projects/dotfiles/.vim/config/devicons.vim
source ~/Projects/dotfiles/.vim/config/clap.vim

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
set lazyredraw
set cursorline
set ttimeout
set ttimeoutlen=2

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
if !exists('g:syntax_on')
	syntax enable
endif

" Faster cursor and typing
set timeoutlen=1000
set ttimeoutlen=0

" ==================================================== Theme
set background=dark
set termguicolors
set t_Co=256
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
colorscheme onedark

" ==================================================== Highlight
hi Search cterm=NONE ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858
hi DiffAdd cterm=NONE ctermfg=NONE ctermbg=236 guifg=NONE guibg=#303030
hi DiffChange cterm=NONE ctermfg=NONE ctermbg=238 guifg=NONE guibg=#444444
hi DiffDelete cterm=reverse ctermfg=0 ctermbg=88 guibg=#3c1f1e
hi DiffText cterm=NONE ctermfg=NONE ctermbg=23 guifg=NONE guibg=#005f5f
hi Normal guibg=#000000
hi EndOfBuffer guibg=#000000
hi FloatermBorder guifg=#5FFF87

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
nmap <space>ve :tabnew ~/.vimrc<CR>
nmap <space>vr :source ~/.vimrc<CR>
nmap <space>tt :tabnew<cr><space>wf
nmap <space>vv :vs<cr><C-w>l
nmap <space>xx :split<cr><C-w>j
nmap <space>wL <c-w>30>
nmap <space>wH <c-w>30<
nmap <space>wJ <c-w>25+
nmap <space>wK <c-w>25-
nmap <script> <silent> <space>3 :copen 1000<cr>G:ColorHighlight!<cr>
nmap <script> <silent> <space>2 :call ToggleQuickfixList()<cr>
nmap <space>w <c-w>
nmap <space>w<cr> <c-w>r<c-w>h<c-w>60>
nmap 'w :wa!<CR>
nmap 'q :wq<CR>
nmap 'e :q!<CR>
nmap 'E :qa!<CR>
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
nmap z[ <c-^>
nmap co :let @+=expand("%:t")<cr>
nmap cl :let @+=expand("%:t")<cr>:Dispatch! osascript ~/Projects/dotfiles/mac_scripts/intelliJ.scpt<cr>
nmap cO :let @+=expand("%:p")[-32:]<cr>
nmap cy :let @+=expand("%:p")<cr>
nmap cf :let @+=expand("%:p:h")<cr>
nmap ch :let @+=expand("%:h")<cr>
nmap cn :let @+=expand("%:t:r")<cr>
nmap cu viwcp
nmap c' vi'cp
nmap c" vi"cp
nmap c$ T v$cp
nmap c<space> T vt cp
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<cr>
nmap <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<cr>
nmap gv :vs<cr><c-w>lgd
nmap gV :vs<cr><c-w>lgf
nmap gs :sp<cr><c-w>lgd
nmap gS :sp<cr><c-w>lgf
nmap gt :tabnew<cr>zogd
nmap gT :tabnew<cr>zogf
nnoremap g' :vs<cr><c-w>l<c-]>
nnoremap g" :sp<cr><c-w>l<c-]>
nnoremap g\ :tabnew<cr><c-o><c-]>

" Better copy/paste behavior
set pastetoggle=<space>4
xnoremap p "_dP

" Miscellaneous
tnoremap <c-o> <c-\><c-n>
noremap <space>cl :ts<CR>
noremap <space>c] :tn<CR>
noremap <space>c[ :tp<CR>
inoremap zbt <Esc>a``<Esc>i
inoremap zbs <Esc>a```<Esc>i
nnoremap <space>cb :bufdo bd<CR>
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
nmap <space>eq yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:tabnew \| terminal <c-r>0<cr>G
vmap <space>eq y:!echo <c-r>0 > ~/bin/current-cmd<cr>:tabnew \| terminal <c-r>0<cr>G
nmap <space>ew :tabnew \| terminal ~/bin/current-cmd<cr>G

" Common functions
nnoremap zp :call common#gotoJump()<cr>
nnoremap <space>ot :call common#openFilesFromClipboard("tabnew")<cr>
nnoremap <space>oo :call common#openFilesFromClipboard("e")<cr>
nnoremap <space>os :call common#openFilesFromClipboard("split")<cr>
nnoremap <space>ov :call common#openFilesFromClipboard("vs")<cr>
nnoremap <space>? :call common#google(expand("<cWORD>"), 0)<cr>
nnoremap <space>! :call common#google(expand("<cWORD>"), 1)<cr>
xnoremap <space>? "gy:call common#google(@g, 0)<cr>gv
xnoremap <space>! "gy:call common#google(@g, 1)<cr>gv
