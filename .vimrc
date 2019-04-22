" ================ Theme ==============================
set background=dark
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='deus'
let g:gruvbox_contrast_dark='hard'
" colorscheme darkest-space
" colorscheme py-darcula
" colorscheme deep-space
" colorscheme jellybeans
" colorscheme zerg
colorscheme gruvbox


" ================ Plugin Config ======================
call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'justinmk/vim-sneak'
" Plug 'ludovicchabant/vim-gutentags'

" Ruby on Rails plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
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

" Terraform plugins
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

call plug#end()


" ================ General Config ====================
set nocompatible              " be iMproved, required filetype off                  " required
" set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on
set nohlsearch


" ================ Turn Off Swap Files ===============
set noswapfile
set nobackup
set nowb


" ================ Persistent Undo ===================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


" ================ Indentation =======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab ts=2 sw=2 ai
" set relativenumber

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=5       "deepest fold is 5 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
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


" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" ================ Rspec ============================
map <Leader>a :call RunCurrentSpecFile()<CR>
map <Leader>e :call RunNearestSpec()<CR>
map <Leader>t :call RunLastSpec()<CR>
map <Leader>al :call RunAllSpecs()<CR>

" let g:rspec_command = "!spring rspec {spec}"
" let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"


" ================ The Silver Searcher ==============
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" =============== CtrlSF configuration ====================
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 1
    \}
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

nnoremap K :CtrlSF <C-R><C-W><CR>
vmap K <Plug>CtrlSFVwordExec


" ================ Ctags ============================
function CtagsRuby()
  Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)
endfunction

function CtagsJS()
  Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=log .
endfunction

map <Leader>cr :call CtagsRuby()<CR>
map <Leader>cj :call CtagsJS()<CR>


" ================ Rubocop ===========================
function Rubocop()
  !rubocop --require rubocop/formatter/checkstyle_formatter
endfunction
command Rubocop :call Rubocop()


" ================ ALE ===============================
" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint', 'flow'],
\  'ruby': ['rubocop'],
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
map <leader>at :ALEToggle<CR>


" ================ Fuzzy Finder =======================
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~50%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Finder mapping
map <space>p :Files<CR>
map <space>h :History<CR>
map <space>b :Buffers<CR>
map <space>c :Commands<CR>
map <space>i :BLines<CR>
map <space>g :GFiles?<CR>
map <space>t :Tags<CR>

" ============== Vim multiple cursors mapping =======
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key =  '<C-m>m'
let g:multi_cursor_select_all_word_key = '<C-m>a'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ============== Setup autocomplete =================
" Note: run python3 install.py --all to download all completer
nmap <F8> :TagbarToggle<CR>
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ============= Session management ==================
let g:session_directory = "~/.vim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1
nnoremap <space> :OpenSession<CR>
nnoremap <space><space>ss :SaveSession
nnoremap <space><space>sd :DeleteSession<CR>
nnoremap <space><space>sc :CloseSession<CR>


" ============= Better motion =======================
map s <Plug>Sneak_s
map <space>s <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


" ============= Better copy/paste behavior ==========
set pastetoggle=<F4>
xnoremap p "_dP


" ============== Ranger ================
let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:ranger_map_keys = 0
map <space>f :Ranger<CR>


" ================ My custom mapping ================
map <space>n :NERDTreeToggle<CR>
map <space>r :NERDTreeFind<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F5> :UndotreeToggle<cr>
nmap - gt
nmap _ gT
nmap <space>- :tabnew<cr>
map <space><S-l> <C-w>35>
map <space><S-h> <C-w>35<
map <space><S-k> <C-w>25+
map <space><S-j> <C-w>25-
nmap <script> <silent> <F3> :copen 1000<CR>
nmap <script> <silent> <F2> :call ToggleQuickfixList()<CR>
map <Leader>w :Dispatch ~/bin/api<CR>
map <Leader>b :!git blame %<CR>
map <Leader>p :ts<CR>
map <Leader>] :tn<CR>
map <Leader>[ :tp<CR>
imap zbt <Esc>a``<Esc>i
nnoremap <leader>bd :bufdo bd<CR>
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l
nnoremap 'w :wa!<CR>
nnoremap 'q :wq<CR>
map <space>cr :Dispatch rubocop --require rubocop-airbnb -a<CR>
map <space>cj :Dispatch yarn lint --fix<CR>
