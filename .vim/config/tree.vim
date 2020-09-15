nnoremap <space>n :NERDTreeToggle<cr>
nnoremap <space>N :NERDTreeFind<cr>
nnoremap <space>5 :UndotreeToggle<cr>

fu! s:findPositionOnTree()
  NERDTreeClose
  let l:currentWindow = winnr() + 1
  NERDTreeCWD
  exe l:currentWindow . "wincmd w"
  NERDTreeFind
  exe 'normal! zz'
  exe l:currentWindow . "wincmd w"
endfu

nmap <space>fs :call <SID>findPositionOnTree()<cr>

let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeDirArrowExpandable = "+"
let NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeWinSize=45

" close a tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd Filetype coc-explorer :IndentLinesDisable

nnoremap <space><space> :CocCommand explorer --preset floating<cr>
nnoremap <space>fe :CocCommand explorer<cr>
nnoremap <space>fv :CocCommand explorer --preset .vim<cr>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\     'position': 'floating',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }
