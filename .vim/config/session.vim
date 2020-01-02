let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <tab>o :OpenSession<CR>
nnoremap <tab>s :SaveSession
nnoremap <tab>d :DeleteSession<CR>
nnoremap <tab>c :CloseSession<CR>
