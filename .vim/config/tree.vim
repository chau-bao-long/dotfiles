nnoremap <space>n :NERDTreeToggle<cr>
nnoremap <space>N :NERDTreeFind<cr>
nnoremap <space>5 :UndotreeToggle<cr>
nmap <space>fs :NERDTreeCWD<cr><c-w>l:NERDTreeFind<cr><c-w>l
nmap <space>fS :NERDTreeCWD<cr><c-w>l<c-w>l:NERDTreeFind<cr><c-w>l<c-w>l

let g:NERDTreeIgnore = ['^data$']

let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeDirArrowExpandable = "+"
let NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeWinSize=45

" close a tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
