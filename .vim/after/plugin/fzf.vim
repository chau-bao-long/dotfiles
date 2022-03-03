fu! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
endfu

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --layout=reverse'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
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
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Finder mapping
let g:rg_command="rg --column --line-number --no-heading --color=always --hidden --follow --glob '!.git/*' --smart-case "

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:70%'), <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, fzf#vim#with_preview('down:70%'), <bang>0)
command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())
command! -bang -nargs=* -complete=dir DG
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(''), 1,                                                                                               
      \   fzf#vim#with_preview({'dir': <q-args>}), <bang>0)

xnoremap Q y:Rg <c-r>0<cr>
nnoremap <space>Q :Rg<cr>
