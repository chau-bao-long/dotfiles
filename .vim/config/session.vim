let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <space><tab>o :OpenSession<CR>
nnoremap <space><tab>s :SaveSession
nnoremap <space><tab>d :DeleteSession<CR>
nnoremap <space><tab>c :CloseSession<CR>
