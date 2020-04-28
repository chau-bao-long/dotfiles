nmap <space>ee /fun <cr>Nwvt(y:exec "Dispatch! echo \"./gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . ".\\*<c-r>0\\* \" > ~/bin/current-cmd"<cr><space>ew
nmap <space>eE /fun <cr>Nwvt(y:exec "Dispatch! echo \"./gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . ".\\*<c-r>0\\* \" > ~/bin/current-cmd"<cr><space>ew
vmap <space>ee y:exec "Dispatch! ./gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . ".\\*<C-R>0\\*"<CR>
vmap <space>eE y:exec "Dispatch! ./gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . ".\\*<C-R>0\\*"<CR>
nmap <space>ef :exec "Dispatch! echo \"./gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . "\" > ~/bin/current-cmd"<cr><space>ew
nmap <space>eF :exec "Dispatch! echo \"./gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . "\" > ~/bin/current-cmd"<cr><space>ew
nmap <leader>gi :Rg override fun <C-R><C-W><CR>
nmap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<CR>
nmap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<CR>class
nmap <space>il yiwggjo<esc>pA<c-space>
nmap <space>is "1yiw<c-]>ggwvE"2y<c-o><c-o>ggjoimport <esc>"2pA.<esc>"1p<c-o>
nmap <space>ip :!echo %:p:h \| sed 's/\//\./g' \| grep -o 'kotlin\.main\..*' \| sed 's/kotlin\.//g' \| sed 's/^/package /' >> %<CR>:e!<CR>

" Easy switching between vim and intelliJ
nnoremap <silent> <space>oi :exec "Dispatch! idea --line " . line('.') . " " . expand('%:p')<cr>

" Beter GF in kotlin and java
nmap gf :call javafunctions#openFile('e')<cr>
nmap gF :call javafunctions#openFile('tabedit')<cr>
