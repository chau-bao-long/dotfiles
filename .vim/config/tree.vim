nnoremap <space>n :NERDTreeToggle<cr>
nnoremap <space>N :NERDTreeFind<cr>
nnoremap <space>5 :UndotreeToggle<cr>
nmap <space>cd :NERDTreeCWD<cr><c-w>l:NERDTreeFind<cr><c-w>l

let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeDirArrowExpandable = "+"
let NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeWinSize=45

" close a tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
