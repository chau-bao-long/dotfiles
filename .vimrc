" ==================================================== Plugin Config
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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

call plug#end()

" ==================================================== Config plugin
source ~/Projects/dotfiles/.vim/config/float-term.vim
source ~/Projects/dotfiles/.vim/config/fzf.vim
source ~/Projects/dotfiles/.vim/config/ctrlfs.vim
source ~/Projects/dotfiles/.vim/config/ctags.vim
source ~/Projects/dotfiles/.vim/config/denite.vim
source ~/Projects/dotfiles/.vim/config/multicursor.vim
source ~/Projects/dotfiles/.vim/config/ale.vim
source ~/Projects/dotfiles/.vim/config/coc.vim
source ~/Projects/dotfiles/.vim/config/session.vim
source ~/Projects/dotfiles/.vim/config/sneak.vim
source ~/Projects/dotfiles/.vim/config/ranger.vim
source ~/Projects/dotfiles/.vim/config/goyo.vim
source ~/Projects/dotfiles/.vim/config/tree.vim
source ~/Projects/dotfiles/.vim/config/git.vim
source ~/Projects/dotfiles/.vim/config/debug.vim

" ==================================================== Theme
set background=dark
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='deus'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" ==================================================== General Config
set nocompatible              " be iMproved, required filetype off
" set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on
set nohlsearch

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
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab ts=4 sw=4 ai

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=2 sw=2 sts=0 expandtab

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
" set noignorecase      " Respect case sensitive when searching...

" ==================================================== Custom mapping
nmap gk :tabprevious<cr>
nmap gj :tabnext<cr>
nmap <space>- :tabnew<CR><space>f
nmap <space>v :vs<CR><C-w>l<space>f
nmap <space>x :split<CR><C-w>j<space>f
map <space>H <C-w>35>
map <space>L <C-w>35<
map <space>K <C-w>25+
map <space>J <C-w>25-
map <space>= <C-w>=
nmap <script> <silent> <space>3 :copen 1000<CR><s-g>
nmap <script> <silent> <space>2 :call ToggleQuickfixList()<CR>
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l
nmap 'w :wa!<CR>
nmap 'q :wq<CR>
nmap 'e :q!<CR>
nmap 'r :edit!<CR>
nmap 't :tabclose<cr>
nmap '2 'e'e
nmap zj <C-d>
nmap zk <C-u>
nmap zh <C-e><C-e><C-e><C-e><C-e>jjjjj
nmap zl <C-y><C-y><C-y><C-y><C-y>kkkkk
nmap <C-j> <C-d>
nmap <C-k> <C-u>
nmap <C-h> <C-e><C-e><C-e><C-e><C-e>jjj
nmap <C-l> <C-y><C-y><C-y><C-y><C-y>kkk
nmap mb 'F
nmap mf mF
nmap zi <C-i>
nmap zo <C-o>
nmap co :let @+=expand("%:t")<CR>
nmap cO :let @+=expand("%:p")[-32:]<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Better copy/paste behavior
set pastetoggle=<space>4
xnoremap p "_dP

" Miscellaneous
map <space>cl :ts<CR>
map <space>c] :tn<CR>
map <space>c[ :tp<CR>
imap zbt <Esc>a``<Esc>i
imap zbs <Esc>a```<Esc>i
nnoremap <leader>bd :bufdo bd<CR>
nmap <space>8 :pwd<CR>
nmap <space>7 :call GoToCurrentFile()<CR>
nmap <space>9 :call GoBack()<CR>
nmap <space>0 :call GoBackToRoot()<CR>
nmap g- :tabm -1<CR>
nmap g= :tabm +1<CR>
vmap / y:/<C-R>0<CR>
nmap <space>e= ggvG=<C-o>
nmap <space>er :e<cr>
nmap <space>iu mf:UltiSnipsEdit<cr>
nmap zp :call GotoJump()<cr>
nmap <space>tm <c-w>T
nmap <space>ew yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0<cr>
nmap <space>eW yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0 && read<cr>
vmap <space>ew y:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0<cr>
vmap <space>eW y:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0 && read<cr>
nmap <space>eq :Dispatch ~/bin/current-cmd<cr>
nmap <space>eQ :Dispatch ~/bin/current-cmd && read<cr>

function GoBack()
  cd ..
  pwd
endfunction

function GoBackToRoot()
  while stridx(execute(":!ls -a"), ".git") < 0 && strlen(execute(":pwd")) > 2
    cd ..
  endwhile
  pwd
endfunction

function GoToCurrentFile()
  cd %:p:h
  pwd
endfunction

function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

" Auto commands
autocmd BufWritePost ~/Projects/algorithm/*.c :Dispatch gcc % && ./a.out
autocmd BufWritePost ~/suckless/*/*.h :Dispatch sudo make clean install

" Terraform 
map <space>etp :Dispatch terraform plan<CR>
map <space>eta :Dispatch terraform apply<CR>
map <space>etd :Dispatch terraform destroy<CR>

" Ruby commands
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
autocmd Filetype ruby nmap <buffer> <space>ef :call RunCurrentSpecFile()<CR>
autocmd Filetype ruby nmap <buffer> <space>ee :call RunNearestSpec()<CR>
autocmd Filetype ruby nmap <buffer> <space>et :call RunLastSpec()<CR>
autocmd Filetype ruby nmap <buffer> <space>ea :call RunAllSpecs()<CR>
autocmd Filetype ruby nmap <buffer> <space>elc :Dispatch rubocop --require rubocop-airbnb -a<CR> 

" JavaScript commands
autocmd Filetype javascript nmap <buffer> <space>elp :Dispatch! cd %:p:h && prettier --write **/*.*<cr>
autocmd Filetype javascript nmap <buffer> <space>elP :Dispatch! prettier --write **/*.*<cr>
autocmd Filetype javascript nmap <buffer> <space>elc :Dispatch eslint %:p:h<cr>
autocmd Filetype javascript nmap <buffer> <space>elC :Dispatch pwd \| xargs eslint<cr>
autocmd Filetype javascript nmap <buffer> <space>elf :Dispatch eslint --fix --max-warnings 7 %:p:h<cr>
autocmd Filetype javascript nmap <buffer> <space>elf :Dispatch pwd \| xargs eslint --fix --max-warnings 7 <cr>
autocmd Filetype javascript nmap <buffer> <space>ef :Dispatch ./node_modules/.bin/jest % && read<cr>:!tmux swap-pane -D \; select-pane -U<cr>
autocmd Filetype javascript nmap <buffer> <space>eF :Dispatch node --inspect-brk --inspect ./node_modules/.bin/jest --runInBand %<cr>
autocmd Filetype javascript nmap <buffer> <space>elt :Dispatch ./node_modules/.bin/flow %;read<cr>
autocmd Filetype javascriptreact nmap <buffer> <space>elt :Dispatch ./node_modules/.bin/flow %;read<cr>

" Kotlin commands
autocmd Filetype kotlin nmap <buffer> <space>ee /@Test<cr>Njwvt(y:exec "Dispatch echo \"~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . ".\\*<c-r>0\\* \" > ~/bin/current-cmd"<cr><space>eq
autocmd Filetype kotlin nmap <buffer> <space>eE /@Test<cr>Njwvt(y:exec "Dispatch echo \"~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . ".\\*<c-r>0\\* \" > ~/bin/current-cmd"<cr><space>eq
autocmd Filetype kotlin vmap <buffer> <space>ee y:exec "Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . ".\\*<C-R>0\\*"<CR>
autocmd Filetype kotlin vmap <buffer> <space>eE y:exec "Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . ".\\*<C-R>0\\*"<CR>
autocmd Filetype kotlin nmap <buffer> <space>ef :exec "Dispatch echo ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . " > ~/bin/current-cmd"<cr><space>eq
autocmd Filetype kotlin nmap <buffer> <space>eF :exec "Dispatch echo ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . " > ~/bin/current-cmd"<cr><space>eq
autocmd Filetype kotlin nmap <buffer> <space>ek :Dispatch! ~/Projects/personio/admin-panel-service/run.sh reload<cr>
autocmd Filetype kotlin nmap <buffer> <space>eK :Dispatch ~/Projects/personio/admin-panel-service/run.sh reload<cr>
autocmd Filetype kotlin nmap <buffer> <space>ec :Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew clean<cr>
autocmd Filetype kotlin nmap <buffer> <space>eb :Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew build<cr>
autocmd Filetype kotlin nmap <buffer> <space>gi :Rg override fun <C-R><C-W><CR>
autocmd Filetype kotlin nmap <buffer> <space>gI :exec "/I" . expand('%:t:r')<CR>n<c-]>
autocmd Filetype kotlin nmap <buffer> <space>gt :exec "Rg " . expand('%:t:r') . "Test"<CR>
autocmd Filetype kotlin nmap <buffer> <space>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<CR>class
autocmd Filetype kotlin nmap <buffer> <space>il yiwggjo<esc>pA<c-space><tab><esc>zo
autocmd Filetype kotlin nmap <buffer> <space>is "1yiw<c-]>ggwvE"2y<c-o><c-o>ggjoimport <esc>"2pA.<esc>"1p<c-o>
autocmd Filetype kotlin nmap <buffer> <space>ip :!echo %:p:h \| sed 's/\//\./g' \| grep -o 'kotlin\.main\..*' \| sed 's/kotlin\.//g' \| sed 's/^/package /' >> %<CR>:e!<CR>
autocmd Filetype kotlin nmap <buffer> <space>elc :Dispatch ktlint<cr>
autocmd Filetype kotlin nmap <buffer> <space>elf :Dispatch! ktlint -F<cr>
autocmd Filetype kotlin nmap <buffer> <leader>gt :Files<cr>test
autocmd Filetype kotlin nmap <buffer> <leader>ga :Files<cr>actions
autocmd Filetype kotlin nmap <buffer> <leader>gr :Files<cr>respositories
autocmd Filetype kotlin nmap <buffer> <leader>ge :Files<cr>endpoints
autocmd Filetype kotlin nmap <buffer> <leader>gf :Files<cr>factories

" PHP commands
autocmd Filetype php nmap <buffer> <space>ee /public function<cr>Nwwvey:!echo phpunit % --filter <c-r>0 > ~/bin/current-cmd<cr>:Dispatch phpunit % --filter <c-r>0<cr>
autocmd Filetype php nmap <buffer> <space>eE :Dispatch phpunit %<cr>
autocmd Filetype php nmap <buffer> <space>ip :!echo "<?php" >> % && echo "" >> % && echo %:h \| sed 's/\//\\/g' \| sed 's/^/namespace /' \| sed 's/$/; /' >> %<CR>:e!<CR>2jwvUGo<CR>
autocmd Filetype php nmap <buffer> <space>is "1yiw<c-]>gg2jwvEh"2y<c-o><c-o>gg3jouse <esc>"2pA\<esc>"1pA;<esc><c-o>
autocmd Filetype php nmap <buffer> <space>io yiwgg3jouse <esc>pA;<esc><c-o>
autocmd Filetype php nmap <buffer> <space>il yiwgg3jo<esc>pASnip<c-space><tab><esc>zo<esc>
autocmd Filetype php nmap <buffer> <space>gt :exec "Rg " . expand('%:t:r') . "Test"<cr>
autocmd Filetype php nmap <buffer> <space>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<cr>class
autocmd Filetype php nmap <buffer> <leader>gr :Rg route<cr>
autocmd Filetype php nmap <buffer> <leader>gc :Rg controllers<cr>
autocmd Filetype php nmap <buffer> <leader>gm :Rg models<cr>
autocmd Filetype php nmap <buffer> <leader>gd :Rg repositories<cr>
autocmd Filetype php nmap <buffer> <leader>gs :Rg services<cr>
autocmd Filetype php nmap <buffer> <leader>gt :Rg test<cr>
