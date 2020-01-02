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

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:80%'), <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, fzf#vim#with_preview('down:80%'), <bang>0)

nmap <space>P :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
nmap <space>p :Files<CR>
nmap <space>u :History<CR>
nmap <space>b :Buffers<CR>
nmap <space>cm :Commands<CR>
nmap <space>ck :Maps<CR>
nmap <space>; :BLines<CR>
nmap <space>w :Rg<CR>
vmap <space>w y:Rg <C-R>0<CR>
nmap W :Rg <C-R><C-W><CR>
nmap Q cpiw<space>p
vmap Q cp<space>p
