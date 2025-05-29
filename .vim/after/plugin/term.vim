let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.85
let g:floaterm_autoclose=0
let g:floaterm_winblend=15
let g:floaterm_title='Terminal No.$1 out of $2'

tnoremap <c-d> <c-\><c-n>:FloatermKill!<cr>
tnoremap <c-b> <c-\><c-n>:FloatermKill<cr>:FloatermToggle<cr>
tnoremap <c-l> <c-\><c-n>:FloatermNext<cr>
tnoremap <c-y> <c-\><c-n>:FloatermToggle!<cr>
tnoremap <c-s> <c-\><c-n>:FloatermNew<cr>
