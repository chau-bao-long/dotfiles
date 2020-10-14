nmap <space>ee :call phpfunctions#runOneTest()<cr>
nmap <space>ef :call phpfunctions#runAllTestsInFile()<cr>
nmap <space>ip :call phpfunctions#generatePhpDirectiveAndNamespace()<cr>
nmap <space>is "1yiw<c-]>gg2jwvEh"2y<c-o><c-o>gg3jouse <esc>"2pA\<esc>"1pA;<esc><c-o>
nmap <space>io yiwgg3jouse <esc>pA;<esc><c-o>
nmap <space>il yiwgg3jo<esc>pASnip<c-space><tab><esc><c-o><esc>
nmap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<cr>
nmap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<cr>class
nmap <space>lc ggVGd:w<cr>
nmap <space>lf :%s/\/var\/www\/html\///g<cr>
nmap <space>lr :edit!<cr>G
nmap <space>lo :tabnew ~/Projects/personio/personio/app/storage-local/logs/laravel.log<cr>:exec WatchForChanges("*", {'autoread':1})<cr>

nnoremap <space>ed w:call phpfunctions#UpdatePhpDocIfExists()<cr>/End function<cr>bhD<c-o>/\/\*\*<cr>Njdjz/
nnoremap cF :call phpfunctions#CopyPhpClassFullPath()<cr><c-o>
