nnoremap <space>n :NERDTreeToggle<CR>
nnoremap <space>r :NERDTreeFind<CR>
nnoremap <space>5 :UndotreeToggle<cr>
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeDirArrowExpandable = "⇉"
let NERDTreeDirArrowCollapsible = "⇊"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeWinSize=50

autocmd VimEnter * NERDTreeToggle .
