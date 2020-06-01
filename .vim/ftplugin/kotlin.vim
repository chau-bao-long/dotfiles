nmap <space>ee :call javafunctions#runOneTest(0)<cr>
nmap <space>eE :call javafunctions#runOneTest(1)<cr>
nmap <space>ef :call javafunctions#runAllTestsInFile(0)<cr>
nmap <space>eF :call javafunctions#runAllTestsInFile(1)<cr>
nmap <leader>gi :Rg override fun <C-R><C-W><CR>
nmap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<CR>
nmap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<CR>class
nmap <space>il yiwggjo<esc>pA<c-space>
nmap <space>is "1yiw<c-]>ggwvE"2y<c-o><c-o>ggjoimport <esc>"2pA.<esc>"1p<c-o>
nmap <space>ip :!echo %:p:h \| sed 's/\//\./g' \| grep -o 'kotlin\.main\..*' \| sed 's/kotlin\.//g' \| sed 's/^/package /' >> %<CR>:e!<CR>

" Easy switching between vim and intelliJ
nnoremap <silent> <space>oi :exec "Dispatch! idea --line " . line('.') . " " . expand('%:p')<cr>
