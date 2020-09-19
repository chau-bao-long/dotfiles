nnoremap <space>5 :UndotreeToggle<cr>
nnoremap <space><space> :CocCommand explorer --preset floating<cr>
nnoremap <space>fe :CocCommand explorer<cr>
nnoremap <space>fv :CocCommand explorer --preset .vim<cr>

autocmd Filetype coc-explorer :IndentLinesDisable

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
