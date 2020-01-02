let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:ranger_map_keys = 0
map <space>f :Ranger<CR>
map <space>tn :RangerNewTab<CR>
nmap <space>td :tabnew ~/todo<CR>
nmap <space>ve :tabnew ~/.vimrc<CR>
nmap <space>vr :source ~/.vimrc<CR>
