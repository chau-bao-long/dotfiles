nnoremap <space>wf :RnvimrToggle<CR>

let g:rnvimr_draw_border = 0
let g:rnvimr_bw_enable = 1
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': float2nr(round(0.6 * &columns)),
            \ 'height': float2nr(round(0.6 * &lines)),
            \ 'col': float2nr(round(0.2 * &columns)),
            \ 'row': float2nr(round(0.2 * &lines)),
            \ 'style': 'minimal' }

highlight NormalFloat ctermfg=0 ctermbg=16 guibg=#2b3038
