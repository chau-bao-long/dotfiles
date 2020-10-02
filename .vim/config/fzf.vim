" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --layout=reverse'

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' , 'window': 'call FloatingFZF()' }

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

nnoremap <space>P :call fzf#run(fzf#wrap(extend({'source': 'git ls-files --exclude-standard --others --cached' }, fzf#vim#with_preview('down:70%'))))<cr>
nnoremap <space>p :Files<cr>
nnoremap <space>u :History<cr>
nnoremap <space>U :GitFiles<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>B :MRU<cr>
nnoremap <space>cm :Commands<cr>
nnoremap <space>ck :Maps<cr>
nnoremap <space>q :Rg<cr>
nnoremap <space>ch :Helptags<cr>
nnoremap Q :Rg <c-r><c-w><cr>
xnoremap Q y:Rg <c-r>0<cr>
nnoremap W "*yiw:Files<cr>
xnoremap W "*y:Files<cr>
