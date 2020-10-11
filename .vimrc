" ==================================================== Plugin Config
call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'milkypostman/vim-togglelist'
Plug 'Konfekt/FastFold'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-floaterm'

Plug 'junegunn/vim-easy-align'
xmap - <Plug>(EasyAlign)

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [ "~/Projects/dotfiles/.vim/UltiSnips/" ]
let g:UltiSnipsEditSplit = 'tabdo'
nmap <space>iu :UltiSnipsEdit<cr>

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
Plug 'beeender/Comrade'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/NrrwRgn'

Plug 'chau-bao-long/java-kotlin-gf'
let g:srcPath = ["/app/build/generated-jooq/"]

Plug 'chau-bao-long/vim-import-kotlin'
let g:learn_path = $HOME . "/Projects/personio"
autocmd Filetype kotlin nnoremap <space>ij :KotlinImport<cr>

Plug 'chau-bao-long/vim-dadbod'
nnoremap <space>st :DBSelectTable<cr>
nnoremap <space>sd :DBDescribeTables<cr>

Plug 'chau-bao-long/semantic-highlight.vim'
nnoremap <Leader>s :SemanticHighlightToggle<cr>

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

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
Plug 'tpope/vim-abolish'

Plug 'tpope/vim-surround'
xmap cs <Plug>VSurround

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
Plug 'jceb/vim-orgmode'
Plug 'terryma/vim-expand-region'

call plug#end()

" ==================================================== Config Plugin
if filereadable(expand("~/Projects/dotfiles/.vim/config/secrets.vim"))
  source ~/Projects/dotfiles/.vim/config/secrets.vim
endif
source ~/Projects/dotfiles/.vim/config/term.vim
source ~/Projects/dotfiles/.vim/config/fzf.vim
source ~/Projects/dotfiles/.vim/config/denite.vim
source ~/Projects/dotfiles/.vim/config/multicursor.vim
source ~/Projects/dotfiles/.vim/config/ale.vim
source ~/Projects/dotfiles/.vim/config/coc.vim
source ~/Projects/dotfiles/.vim/config/session.vim
source ~/Projects/dotfiles/.vim/config/sneak.vim
source ~/Projects/dotfiles/.vim/config/tree.vim
source ~/Projects/dotfiles/.vim/config/git.vim
source ~/Projects/dotfiles/.vim/config/debug.vim
source ~/Projects/dotfiles/.vim/config/devicons.vim
source ~/Projects/dotfiles/.vim/config/expand-region.vim
source ~/Projects/dotfiles/.vim/config/fold.vim

" ==================================================== General Config
filetype plugin indent on

set nocompatible                " be iMproved, required filetype off
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set guicursor=n:blinkon1        "Fix bug cursor of COC
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8
set number
set cursorline

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
if !exists('g:syntax_on')
	syntax enable
endif

" ==================================================== Theme
set background=dark
set termguicolors
set t_Co=256
let ayucolor="dark"
let g:lightline = {
  \ 'colorscheme': 'ayu',
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \ }
  \ }
colorscheme ayu

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

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
hi CocExplorerFileDirectoryCollapsed guifg=#C3526E
hi CocExplorerFileDirectoryExpanded guifg=#C3526E
hi CocExplorerFileDirectory guifg=#61CE91
hi CocExplorerNormalFloat guibg=#0b0c0e

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
nmap gk :tabprevious<cr>
nmap gj :tabnext<cr>
nmap <space>ve :tabnew ~/.vimrc<CR>
nmap <space>vr :source ~/.vimrc<CR>
nmap <space>wt :tabnew<cr><c-o>
nmap <space>vv :vs<cr><C-w>l
nmap <space>xx :split<cr><C-w>j
nmap <space>> <c-w>30>
nmap <space>< <c-w>30<
nmap <space>wu <c-w>25-
nmap <space>wd <c-w>25+
nmap <script> <silent> <space>3 :copen 1000<cr>
nmap <script> <silent> <space>2 :call ToggleQuickfixList()<cr>
nmap <space>w <c-w>
nmap <space>w<cr> <c-w>r<c-w>h<c-w>60>
nmap 'w :wa!<CR>
nmap 'q :wq<CR>
nmap 'e :q!<CR>
nmap 'E :qa!<CR>
nmap 'r :edit!<cr>
nmap 't :tabclose<cr>
nmap <C-j> <C-d>
nmap <C-k> <C-u>
nmap <C-h> <C-e><C-e><C-e><C-e><C-e>
nmap <C-l> <C-y><C-y><C-y><C-y><C-y>
nmap z; :e #<cr>
nmap cf :let @+=expand("%F")<cr>
nmap co :let @+=expand("%:t")<cr>
nmap cy :let @+=expand("%:p")<cr>
nmap cH :let @+=expand("%:p:h")<cr>
nmap ch :let @+=expand("%:h")<cr>
nmap cn :let @+=expand("%:t:r")<cr>
xmap cp "*y
nmap cu viw"*y
nmap c' vi'"*y
nmap c" vi""*y
nmap c$ T v$"*y
nmap cl "*yy
nmap c<space> T vt "*y
nmap gv :vs<cr><c-w>lgd
nmap gV :vs<cr><c-w>lgf
nmap gs :sp<cr><c-w>lgd
nmap gS :sp<cr><c-w>lgf
nmap gt :tabnew<cr><c-o>gd
nmap gT :tabnew<cr><c-o>gf
nnoremap g' :vs<cr><c-w>l<c-]>
nnoremap g" :sp<cr><c-]>
nnoremap g\ :tabnew<cr><c-o><c-]>
vnoremap m <esc>ggVG
vnoremap o <esc>T vt 
vnoremap O <esc>T v$

" Better copy/paste behavior
set pastetoggle=<space>4
xnoremap p "_dP

" Miscellaneous
tnoremap <c-o> <c-\><c-n>
noremap <space>cl :ts<CR>
noremap <space>c] :tn<CR>
noremap <space>c[ :tp<CR>
inoremap zbt <Esc>a``<Esc>i
inoremap zbs <Esc>a```<cr>```<Esc>O
nnoremap <space>cb :bufdo bd!<cr>
nnoremap <space>9 :pwd<cr>
nnoremap <space>8 :call common#goToCurrentFile()<cr>
nnoremap <space>0 :call common#goBack()<cr>
nnoremap <silent><space>rr :call common#goBackToRoot()<cr>:pwd<cr>
nnoremap <space>* :call common#goToCurrentFile()<cr>:call common#goBack()<cr>
nnoremap g- :tabm -1<cr>
nnoremap g= :tabm +1<cr>
nnoremap g0 :tabo<cr>
nnoremap <space>ss :%s/<c-r><c-w>//gI<left><left><left>
xnoremap <space>ss y:%s/<c-r>0//gI<left><left><left>
nnoremap <space>sS :%s/<c-r><c-w>//gIc<left><left><left><left>
xnoremap <space>sS y:%s/<c-r>0//gIc<left><left><left><left>
xnoremap / y:/<c-r>0<cr>
nnoremap <space>e= 15kV30j=15j
nnoremap <space>er :e!<cr>
nmap <space>eq yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:tabnew \| terminal <c-r>0<cr>G
vmap <space>eq y:!echo <c-r>0 > ~/bin/current-cmd<cr>:tabnew \| terminal <c-r>0<cr>G
nmap <space>ew :call common#runCurrentCommand()<cr>

" Common functions
nnoremap zp :call common#gotoJump()<cr>
nnoremap <space>ot :call common#openFilesFromClipboard("tabnew")<cr>
nnoremap <space>oo :call common#openFilesFromClipboard("e")<cr>
nnoremap <space>os :call common#openFilesFromClipboard("split")<cr>
nnoremap <space>ov :call common#openFilesFromClipboard("vs")<cr>
nnoremap <space>oT :call common#openZipFilesFromClipboard("tabnew")<cr>
nnoremap <space>oO :call common#openZipFilesFromClipboard("e")<cr>
nnoremap <space>oS :call common#openZipFilesFromClipboard("split")<cr>
nnoremap <space>oV :call common#openZipFilesFromClipboard("vs")<cr>
nnoremap <space>? :call common#google(expand("<cWORD>"), 0)<cr>
nnoremap <space>/ :call common#google(expand("<cword>"), 0)<cr>
nnoremap <space>! :call common#google(expand("<cWORD>"), 1)<cr>
xnoremap <space>/ "gy:call common#google(@g, 0)<cr>
xnoremap <space>! "gy:call common#google(@g, 1)<cr>
nnoremap <space>Wh :call common#moveToPrevTab()<cr><c-w>H
nnoremap <space>Wl :call common#moveToNextTab()<cr><c-w>H
nnoremap <space>we :call common#moveToOppositeWindow()<cr>

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

" Auto equally resize windows when vim changes size
autocmd VimResized * wincmd =
