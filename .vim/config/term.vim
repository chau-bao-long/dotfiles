let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.85
let g:floaterm_autoclose=0
let g:floaterm_winblend=15
let g:floaterm_title='Terminal No.$1 out of $2'

nnoremap <space>y :FloatermToggle!<cr>
nnoremap <space>; :FloatermNew<cr>
nnoremap <space>te :FloatermNew quickrun<cr>
nnoremap <space>tp :FloatermNew quickpass<cr>
nnoremap <space>tr :FloatermNew ranger<cr>
nnoremap <space>tg :FloatermNew lazygit<cr>
nnoremap <space>td :FloatermNew lazydocker<cr>
nnoremap <space>tn :FloatermNew ncdu<cr>
nnoremap <space>th :FloatermNew htop<cr>
nnoremap <space>ty :FloatermNew ytop<cr>
nnoremap <space>tcn :FloatermNew node<cr>
nnoremap <space>tcp :FloatermNew python<cr>
nnoremap <space>tch :FloatermNew kubectl exec -it $(kubectl get pod -l app.kubernetes.io/name=web -o=jsonpath='{$.items[:1].metadata.name}') -- php artisan tinker<cr>
nnoremap <space>tck :FloatermNew kotlin<cr>
nnoremap <space>tks :FloatermNew watch kubectl get pod -owide -A<cr>
tnoremap <c-d> <c-\><c-n>:FloatermKill!<cr>
tnoremap <c-b> <c-\><c-n>:FloatermKill<cr>:FloatermToggle<cr>
" tnoremap <c-h> <c-\><c-n>:FloatermPrev<cr>
tnoremap <c-l> <c-\><c-n>:FloatermNext<cr>
tnoremap <c-y> <c-\><c-n>:FloatermToggle!<cr>
tnoremap <c-s> <c-\><c-n>:FloatermNew<cr>

nnoremap <leader>tv :vs\|:te<cr>i
nnoremap <leader>ts :sp\|:te<cr>i
nnoremap <leader>tt :tabnew\|:te<cr>i

function! FloatingFZF()
    let height = float2nr((&lines - 2) / 1.1)
    let row = float2nr((&lines - height) / 2)
    let width = float2nr(&columns / 1.12)
    let col = float2nr((&columns - width) / 2)
    let opts = {
                \ 'relative': 'editor',
                \ 'row': row,
                \ 'col': col,
                \ 'width': width,
                \ 'height':height,
                \ }
    " Border Window
    let border_opts = {
                \ 'relative': 'editor',
                \ 'row': row - 1,
                \ 'col': col - 2,
                \ 'width': width + 4,
                \ 'height': height + 2,
                \ 'style': 'minimal'
                \ }
    let top = "╭" . repeat("─", width + 2) . "╮"
    let mid = "│" . repeat(" ", width + 2) . "│"
    let bot = "╰" . repeat("─", width + 2) . "╯"
    let lines = [top] + repeat([mid], height) + [bot]
    let bbuf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
    let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
    call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatermBorder')

    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, 'number', 'no')
    let win =  nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&number', 0)
    call setwinvar(win, '&relativenumber', 0)
    call setwinvar(win, '&winblend', 15)
    " Close border window when terminal window close
    autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction
