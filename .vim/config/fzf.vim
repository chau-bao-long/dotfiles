" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' , 'window': 'call FloatingFZF()' }

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
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Finder mapping
let g:rg_command="rg --column --line-number --no-heading --color=always --hidden --follow --glob '!.git/*' --smart-case "

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:70%'), <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, fzf#vim#with_preview('down:70%'), <bang>0)
command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

nmap <space>P :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<cr>
nmap <space>p :Files<cr>
nmap <space>y :History<cr>
nmap <space>u :MRU<cr>
nmap <space>b :Buffers<cr>
nmap <space>cm :Commands<cr>
nmap <space>ck :Maps<cr>
nmap <space>; :BLines<cr>
nmap <space>q :Rg<cr>
nmap <space>ch :Helptags<cr>
nmap Q :Rg <c-r><c-w><cr>
vmap Q y:Rg <C-R>0<cr>
nmap W cpiw<space>p
vmap W cp<space>p
