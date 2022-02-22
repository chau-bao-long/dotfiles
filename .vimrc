" ==================================================== All plugins
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/edge'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'chau-bao-long/Comrade'

Plug 'akinsho/nvim-bufferline.lua'
nnoremap <silent>gl :BufferLineCycleNext<CR>
nnoremap <silent>gh :BufferLineCyclePrev<CR>

Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'milkypostman/vim-togglelist'
Plug 'Konfekt/FastFold'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'glepnir/dashboard-nvim'
let g:dashboard_default_executive = 'telescope'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-m>'
let g:VM_maps['Find Subword Under'] = '<C-m>'

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [ "~/Projects/dotfiles/.vim/UltiSnips/" ]
let g:UltiSnipsEditSplit = 'tabdo'
nmap <space>iu :UltiSnipsEdit<cr>

Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'chau-bao-long/actions.nvim'
Plug 'udalov/kotlin-vim'
Plug 'honza/vim-snippets'
Plug 'xolox/vim-misc'
Plug 'justinmk/vim-sneak'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'chrisbra/NrrwRgn'
Plug 'karb94/neoscroll.nvim'
Plug 'gelguy/wilder.nvim'
Plug 'xiyaowong/nvim-cursorword'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim

Plug 'AndrewRadev/sideways.vim'
nnoremap <space>sl :SidewaysJumpRight<cr>
nnoremap <space>sh :SidewaysJumpLeft<cr>
nnoremap <space>sL :SidewaysRight<cr>
nnoremap <space>sH :SidewaysLeft<cr>

Plug 'chau-bao-long/java-kotlin-gf'
let g:srcPath = ["/app/build/generated-jooq/"]

Plug 'chau-bao-long/vim-import-kotlin'
let g:learn_path = $HOME . "/Projects/personio"
autocmd Filetype kotlin nnoremap <space>ij :KotlinImport<cr>
autocmd Filetype kotlin nnoremap <space>ia :ComradeImport<cr>

Plug 'chau-bao-long/vim-dadbod'
nnoremap <space>st :DBSelectTable<cr>
nnoremap <space>sd :DBDescribeTables<cr>

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'pechorin/any-jump.vim'
nnoremap <space>jk :AnyJump<CR>
nnoremap <space>jl :AnyJumpLastResults<CR>
xnoremap <space>jc :AnyJumpVisual<CR>

Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'

Plug 'tpope/vim-surround'
let g:surround_no_mappings = 1
xmap ss <Plug>VSurround
nmap ss <Plug>Csurround

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'ray-x/go.nvim'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'jparise/vim-graphql'
Plug 'Galooshi/vim-import-js'
Plug 'Rican7/php-doc-modded'

Plug 'dyng/ctrlsf.vim'
vnoremap <space>cf y:CtrlSF <c-r>0<cr>
nnoremap <space>cf y:CtrlSF 

Plug 'terryma/vim-expand-region'

call plug#end()

" ==================================================== General Config
filetype plugin indent on

set nocompatible                " be iMproved, required filetype off
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8
set cursorline
set number

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
if !exists('g:syntax_on')
	syntax enable
endif

" ==================================================== Theme
colorscheme edge

set background=dark
set termguicolors
set t_Co=256
let ayucolor="dark"

if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

" ==================================================== Highlight
hi Search cterm=NONE ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858
hi DiffAdd cterm=NONE ctermfg=NONE ctermbg=236 guifg=NONE guibg=#303030
hi DiffChange cterm=NONE ctermfg=NONE ctermbg=238 guifg=NONE guibg=#444444
hi DiffDelete cterm=reverse ctermfg=0 ctermbg=88 guibg=#000000 guifg=#3c1f1e
hi DiffText cterm=NONE ctermfg=NONE ctermbg=23 guifg=NONE guibg=#005f5f
hi Normal guibg=#000000
hi EndOfBuffer guibg=#000000
hi FloatermBorder guifg=#55E579
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#16181C gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=#000000 guibg=#55E579 gui=NONE
hi DeniteBackground ctermfg=NONE ctermbg=24 cterm=NONE guifg=#ffffff guibg=#000000 gui=NONE
hi CursorLine guibg=#323232 guifg=NONE

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
autocmd Filetype c setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype xml setlocal ts=4 sw=4 sts=0 expandtab

" Auto indent pasted text
nnoremap p p=`]
nnoremap P P=`]

filetype plugin on
filetype indent on

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

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
nnoremap <silent> z/ :noh<cr>

" ==================================================== Custom mapping
nnoremap Y v$"+y
nmap gk :tabprevious<cr>
nmap gj :tabnext<cr>
nmap <script> <silent> <space>3 :copen 1000<cr>
nmap <script> <silent> <space>2 :call ToggleQuickfixList()<cr>
nmap <space>w <c-w>
nmap z; :e #<cr>
nnoremap <space>ve :tabnew ~/.vimrc<CR>
nnoremap <space>vr :source ~/.vimrc<CR>
nnoremap <space>vs yy:<c-r>0<cr>
xnoremap <space>vs y:<c-r>0<cr>
nnoremap <space>wt :tabnew<cr>
nnoremap <space>vv :vs<cr><C-w>l
nnoremap <space>xx :split<cr><C-w>j
nnoremap <space>. <c-w>30>
nnoremap <space>, <c-w>30<
nnoremap <space>wu <c-w>25-
nnoremap <space>wd <c-w>25+
nnoremap <space>w1 :call nvim_win_close(win_getid(1), 0)<cr>
nnoremap <space>w2 :call nvim_win_close(win_getid(2), 0)<cr>
nnoremap <space>w3 :call nvim_win_close(win_getid(3), 0)<cr>
nnoremap <space>w4 :call nvim_win_close(win_getid(4), 0)<cr>
nnoremap <space>w5 :call nvim_win_close(win_getid(5), 0)<cr>
nnoremap 'w :w!<CR>
nnoremap 'a :wa!<CR>
nnoremap 'W :w !sudo tee %<cr>
nnoremap 'q :wq<CR>
nnoremap 'e :q!<CR>
nnoremap 'E :qa!<CR>
nnoremap 'r :edit!<cr>
nnoremap 't :tabclose<cr>
nnoremap 'c :bd<cr>
nnoremap <space>cf :let @+=expand("%F")<cr>
nnoremap <space>ct :let @+=expand("%:t")<cr>
nnoremap <space>cp :let @+=expand("%:p")<cr>
nnoremap <space>cH :let @+=expand("%:p:h")<cr>
nnoremap <space>ch :let @+=expand("%:h")<cr>
nnoremap <space>cr :let @+=expand("%:t:r")<cr>
nnoremap <space>cl V"*y
xnoremap E "*y
nnoremap E viw"*y
nnoremap W viW"*y
nnoremap <space>c' vi'"*y
nnoremap <space>c" vi""*y
nnoremap <space>c( vi("*y
nnoremap <space>c[ vi["*y
nnoremap <space>c{ vi{"*y
nnoremap <space>c$ T v$"*y
nnoremap gx viWy:!open <c-r>0 &<CR>
vnoremap gx y:!open '<c-r>0' &<CR>
nmap gv :vs<cr><c-w>lgd
nmap gV :vs<cr><c-w>lgf
nmap gs :sp<cr><c-w>jgd
nmap gS :sp<cr><c-w>jgf
nmap gt :tabnew<cr><c-o>gd
nmap gT :tabnew<cr><c-o>gf
nmap g' :vs<cr><c-w>l<c-]>
nmap g" :sp<cr><c-]>
nmap g\ :tabnew<cr><c-o><c-]>
vnoremap m <esc>ggVG
nnoremap me :messages<cr>
nnoremap mc :messages clear<cr>

" Better copy/paste behavior
set pastetoggle=<space>4
xnoremap p "_dP

" Miscellaneous
tnoremap <c-o> <c-\><c-n>
nnoremap <space>cb :bufdo bd!<cr>
nnoremap <space>co :%bd\|e#\|bd#<cr>\|'"
nnoremap <space>9 :pwd<cr>
nnoremap <space>8 :call common#goToCurrentFile()<cr>
nnoremap <space>0 :call common#goBack()<cr>
nnoremap <silent><space>r :call common#goBackToRoot()<cr>:pwd<cr>
nnoremap <space>* :call common#goToCurrentFile()<cr>:call common#goBack()<cr>
nnoremap g- :tabm -1<cr>
nnoremap g= :tabm +1<cr>
nnoremap g0 :tabo<cr>
nnoremap <space>ss :%s/<c-r><c-w>/<c-r><c-w>/gI<left><left><left>
xnoremap <space>ss y:%s/<c-r>0/<c-r>0/gI<left><left><left>
nnoremap <space>sS :%s/<c-r><c-w>/<c-r><c-w>/gIc<left><left><left><left>
xnoremap <space>sS y:%s/<c-r>0/<c-w>0/gIc<left><left><left><left>
xnoremap / y:/<c-r>0<cr>
nnoremap <space>er :e!<cr>
nnoremap <space>ew :call common#runCurrentCommand()<cr>
nnoremap <leader>bl :s/\((\zs\\|,\ *\zs\\|)\)/\r&/g<cr><bar>:'[,']normal ==<cr>:noh<cr>

" Common functions
nnoremap <space>ot :call common#openFilesFromClipboard("tabnew")<cr>
nnoremap <space>oo :call common#openFilesFromClipboard("e")<cr>
nnoremap <space>os :call common#openFilesFromClipboard("split")<cr>
nnoremap <space>ov :call common#openFilesFromClipboard("vs")<cr>
nnoremap <space>oT :call common#openZipFilesFromClipboard("tabnew")<cr>
nnoremap <space>oO :call common#openZipFilesFromClipboard("e")<cr>
nnoremap <space>oS :call common#openZipFilesFromClipboard("split")<cr>
nnoremap <space>oV :call common#openZipFilesFromClipboard("vs")<cr>
nnoremap <space>? :call common#google(expand("<cWORD>"), 0)<cr>
nnoremap <space>! :call common#google(expand("<cWORD>"), 1)<cr>
xnoremap <space>! "gy:call common#google(@g, 1)<cr>
nnoremap <space>Wh :call common#moveToPrevTab()<cr><c-w>H
nnoremap <space>Wl :call common#moveToNextTab()<cr><c-w>H
nnoremap <space>we :call common#moveToOppositeWindow()<cr>
nnoremap <space>sf :call common#selectProject("~/Projects/personio", function("common#openFileInProjectHandler"), 0)<cr>
nnoremap <space>sF :call common#selectProject("~/Projects", function("common#openFileInProjectHandler"), 0)<cr>
nnoremap <space>sg :call common#selectProject("~/Projects/personio", function("common#grepInProjectHandler"), 0)<cr>
nnoremap <space>sG :call common#selectProject("~/Projects", function("common#grepInProjectHandler"), 0)<cr>

" Quickly move current line
nnoremap <c-n> :m .+1<CR>==
nnoremap <c-p> :m .-2<CR>==
inoremap <c-n> <Esc>:m .+1<CR>==gi
inoremap <c-p> <Esc>:m .-2<CR>==gi
vnoremap <c-n> :m '>+1<CR>gv=gv
vnoremap <c-p> :m '<-2<CR>gv=gv

" Clears and redraws the screen, fixing syntax highlighting
nnoremap <leader>d :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap # #zzzv
nnoremap * *zzzv

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Auto equally resize windows when vim changes size
autocmd VimResized * wincmd =
