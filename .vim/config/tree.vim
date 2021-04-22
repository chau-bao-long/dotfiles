nnoremap <space>5 :UndotreeToggle<cr>
nnoremap <space>l :CocCommand explorer --preset floating<cr>
nnoremap <space>fe :CocCommand explorer<cr>
nnoremap <space>fl :call <SID>findLocationOnTree()<cr>
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

fu s:findLocationOnTree()
  let l:lastWinId = win_getid(winnr())
  call nvim_win_close(win_getid(1), 0)
  call coc#rpc#notify('runCommand', ['explorer'])
  sleep 100m
  call win_gotoid(l:lastWinId)
endfu
