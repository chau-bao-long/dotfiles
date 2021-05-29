nmap <space>ee :call phpfunctions#runOneTest()<cr>
nmap <space>ef :call phpfunctions#runAllTestsInFile()<cr>
nmap <space>ec :call phpfunctions#runOneTestOnContainer()<cr>
nmap <space>eC :call phpfunctions#runAllTestsInFileOnContainer()<cr>
nmap <space>ip :call phpfunctions#generatePhpDirectiveAndNamespace()<cr>
nmap <space>is "1yiw<c-]>gg2jwvEh"2y<c-o><c-o>gg3jouse <esc>"2pA\<esc>"1pA;<esc><c-o>
nmap <space>io yiwgg3jouse <esc>pA;<esc><c-o>
nmap <space>il yiwgg3jo<esc>pASnip<c-space><tab><esc><c-o><esc>
nmap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<cr>
nmap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<cr>class

nnoremap <space>ed 0ww:call phpfunctions#UpdatePhpDocIfExists()<cr>/End function<cr>bhD<c-o>/\/\*\*<cr>Njdjz/
nnoremap cF :call phpfunctions#CopyPhpClassFullPath()<cr><c-o>
