let g:ctrlsf_auto_focus = {
            \ "at": "start"
            \ }
let g:ctrlsf_auto_close = {
            \ "normal" : 1,
            \ "compact": 1
            \}
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

nnoremap <C-F>s :CtrlSF <C-R><C-W><CR>
vmap <c-f>s <Plug>CtrlSFVwordExec
