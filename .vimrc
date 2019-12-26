" ==================================================== Theme
set background=dark
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='deus'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

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

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ==================================================== Folds

set foldmethod=indent   "fold based on indent
set foldnestmax=5       "deepest fold is 5 levels
set nofoldenable        "dont fold by default

" ==================================================== Completion

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

" ==================================================== Scrolling
set scrolloff=3         "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ==================================================== Search
set incsearch       " Find the next match as we type the search
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" set noignorecase      " Respect case sensitive when searching...

" ==================================================== The Silver Searcher
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

" ==================================================== CtrlSF configuration
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

" ==================================================== Ctags
function CtagsRubyIncludeLib()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)
endfunction

function CtagsRuby()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log .
endfunction

function CtagsJSIncludeLib()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=dist --exclude=log .
endfunction

function CtagsJS()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=log --exclude=node_modules --exclude=dist .
endfunction

function CtagsPythonIncludeLib()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log . $(pip show pip | grep Location | cut -d ":" -f 2)
endfunction

function CtagsPython()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log .
endfunction

function CtagsPHP()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=PHP --exclude=.git --exclude=log .
endfunction

function CtagsKotlin()
  call GoBackToRoot()
  Dispatch! ctags -R --languages=kotlin --exclude=.git --exclude=log --exclude=.gradle --exclude=.gradle-home --exclude=data .
endfunction

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <space>cr :call CtagsRubyIncludeLib()<CR>
map <space>cR :call CtagsRuby()<CR>
map <space>cp :call CtagsPythonIncludeLib()<CR>
map <space>cP :call CtagsPython()<CR>
map <space>cj :call CtagsJSIncludeLib()<CR>
map <space>cJ :call CtagsJS()<CR>
map <space>ch :call CtagsPHP()<CR>
map <space>ck :call CtagsKotlin()<CR>

" ==================================================== Fuzzy Finder
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
nmap <space>p :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
nmap <space>P :Files<CR>
nmap <space>u :History<CR>
nmap <space>b :Buffers<CR>
nmap <space>c :Commands<CR>
nmap <space>; :BLines<CR>
nmap <space>w :Rg<CR>
vmap <space>w y:Rg <C-R>0<CR>
nmap W :Rg <C-R><C-W><CR>
nmap Q cpiw<space>p
vmap Q cp<space>p
nmap co :let @+=expand("%:t")<CR>

" ==================================================== Vim multiple cursors mapping
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key =  '<C-m>m'
let g:multi_cursor_select_all_word_key = '<C-m>a'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ================ ALE ===============================
let g:ale_linters = {
\  'javascript': ['eslint', 'flow'],
\  'ruby': ['rubocop'],
\  'kotlin': ['ktlint'],
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
nmap <leader>at :ALEToggle<CR>

" ==================================================== COC
set guicursor=n:blinkon1
set updatetime=300
set shortmess+=c

let g:coc_global_extensions = [
   \'coc-ultisnips',
   \'coc-tag',
   \'coc-phpls',
   \'coc-json',
   \'coc-tsserver',
   \'coc-css',
   \'coc-html',
   \'coc-solargraph',
   \'coc-yaml',
   \'coc-python',
   \'coc-svg',
   \'coc-flow'
\]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window
nnoremap <space>ad :call <SID>show_documentation()<CR>

nnoremap <silent> <space>ay  :<C-u>CocList -A --normal yank<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>aa  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ae  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>ac  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>ao  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>as  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>aj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ak  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>ap  :<C-u>CocListResume<CR>
" Restart coc
nnoremap <silent> <space>ar  :CocRestart<CR>
" Coc info
nnoremap <silent> <space>ai  :CocInfo<CR>

" ==================================================== Session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <tab>o :OpenSession<CR>
nnoremap <tab>s :SaveSession
nnoremap <tab>d :DeleteSession<CR>
nnoremap <tab>c :CloseSession<CR>

" ==================================================== Better motion
map s <Plug>Sneak_s
map <space>s <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" ==================================================== Better copy/paste behavior
set pastetoggle=<space>4
xnoremap p "_dP

" ==================================================== Ranger
let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:ranger_map_keys = 0
map <space>f :Ranger<CR>
map <space>tn :RangerNewTab<CR>
nmap <space>td :tabnew ~/todo<CR>
nmap <space>ve :tabnew ~/.vimrc<CR>
nmap <space>ze :tabnew ~/.zshrc<CR>
nmap <space>te :tabnew ~/.tmux.conf.local<CR>
nmap <space>vr :source ~/.vimrc<CR>

" ==================================================== Goyo
nmap zy :Goyo 280x850%<CR>
nmap zu :Goyo!<CR>

" ==================================================== My custom mapping
nmap - gt
nmap _ gT
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
nnoremap 'w :wa!<CR>
nnoremap 'q :wq<CR>
nnoremap 'e :q!<CR>
nnoremap 'r :edit!<CR>
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
nmap <space>eh1 :tabnew ~/bin/personio.api<cr>
nmap <space>eh2 :tabnew ~/bin/admin-panel.api<cr>
nmap <space>ew yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0<cr>
nmap <space>eW yy:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0 && sleep 9999<cr>
vmap <space>ew y:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0<cr>
vmap <space>eW y:!echo <c-r>0 > ~/bin/current-cmd<cr>:Dispatch <c-r>0 && sleep 9999<cr>
nmap <space>eq :Dispatch ~/bin/current-cmd<cr>
nmap <space>eQ :Dispatch ~/bin/current-cmd && sleep 9999<cr>

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

" NerdTree & UndoTree
map <space>n :NERDTreeToggle<CR>
map <space>r :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
nnoremap <space>5 :UndotreeToggle<cr>

" Linter
map <Leader>cr :Dispatch rubocop --require rubocop-airbnb -a<CR>
map <Leader>cj :Dispatch yarn lint --fix<CR>

" Terraform 
map <space>etp :Dispatch terraform plan<CR>
map <space>eta :Dispatch terraform apply<CR>
map <space>etd :Dispatch terraform destroy<CR>

" Git
map <space>gg :Git 
map <space>gl :Glog<CR>
map <space>g0l :0Glog<CR>
map <space>gd :Gdiff 
map <space>g3d :Gvdiffsplit!<CR>
map <space>gpr :Ggrep 
map <space>gr :Gread! 
map <space>gw :Gwrite<CR>
map <space>gbl :Gblame<CR>
map <space>gbr :Gbrowse<CR>
map <space>gs :Gstatus<CR>
map <space>ge :Gedit 
map <space>gvs :Gvsplit<CR>
map <space>gsp :Gsplit<CR>
map <space>gca :Gcommit --amend<CR>
map <space>gci :Gcommit<CR>
map <space>gpu :Gpush<CR>
map <space>gpf :Gpush -f<CR>
map <space>gfo :Gfetch origin<CR>
map <space>gpl :Gpull<CR>

" Vdebug
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9001
nmap <space>de :VdebugEval 
nmap <space>dt :VdebugTrace 
vmap <space>de y:VdebugEval <C-R>0<CR>
vmap <space>dt y:VdebugTrace <C-R>0<CR>

" Vebugger
map <space>da :call vebugger#jdb#attach('admin.dev.personio.de:30691', {'srcpath':['~/Projects/personio/admin-panel-service/app/src/test/kotlin']})<CR>:sleep 500m<CR>:VBGcontinue<CR>
map <space>dA :call vebugger#jdb#attach('admin.dev.personio.de:30691', {'srcpath':['~/Projects/personio/admin-panel-service/app/src/main/kotlin']})<CR>:sleep 500m<CR>:VBGcontinue<CR>
map <space>db :VBGtoggleBreakpointThisLine<CR>
map <space>d2 :VBGstepOver<CR>
map <space>d3 :VBGstepIn<CR>
map <space>d4 :VBGstepOut<CR>
map <space>d5 :VBGcontinue<CR>
map <space>d6 :VBGkill<CR>
map <space>d; :VBGtoggleTerminalBuffer<CR>
map <space>dw :VBGrawWrite 
map <space>ds :VBGrawWrite list<CR>
map <space>dj :VBGeval 
map <space>dk :VBGevalWordUnderCursor<CR>
map <space>dl :VBGevalSelectedText<CR>

" Auto commands
autocmd BufWritePost ~/Projects/algorithm/*.c :Dispatch gcc % && ./a.out
autocmd BufWritePost ~/suckless/*/*.h :Dispatch sudo make clean install

" Ruby commands
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
autocmd Filetype ruby nmap <buffer> <space>ef :call RunCurrentSpecFile()<CR>
autocmd Filetype ruby nmap <buffer> <space>ee :call RunNearestSpec()<CR>
autocmd Filetype ruby nmap <buffer> <space>et :call RunLastSpec()<CR>
autocmd Filetype ruby nmap <buffer> <space>ea :call RunAllSpecs()<CR>

" JavaScript commands
autocmd Filetype javascript nmap <buffer> <space>elp :Dispatch! cd %:p:h && prettier --write **/*.*<cr>
autocmd Filetype javascript nmap <buffer> <space>elP :Dispatch! prettier --write **/*.*<cr>
autocmd Filetype javascript nmap <buffer> <space>elc :Dispatch eslint %:p:h<cr>
autocmd Filetype javascript nmap <buffer> <space>elC :Dispatch pwd \| xargs eslint<cr>
autocmd Filetype javascript nmap <buffer> <space>elf :Dispatch eslint --fix --max-warnings 7 %:p:h<cr>
autocmd Filetype javascript nmap <buffer> <space>elf :Dispatch pwd \| xargs eslint --fix --max-warnings 7 <cr>

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
