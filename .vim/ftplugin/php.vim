nmap <space>ee /public function<cr>Nwwvey:!echo phpunit % --filter <c-r>0 > ~/bin/current-cmd<cr>:Dispatch phpunit % --filter <c-r>0<cr>
nmap <space>ef :Dispatch phpunit %<cr>
nmap <space>ip :!echo "<?php" >> % && echo "" >> % && echo %:h \| sed 's/\//\\/g' \| sed 's/^/namespace /' \| sed 's/$/; /' >> %<CR>:e!<CR>2jwvUGo<CR>
nmap <space>is "1yiw<c-]>gg2jwvEh"2y<c-o><c-o>gg3jouse <esc>"2pA\<esc>"1pA;<esc><c-o>
nmap <space>io yiwgg3jouse <esc>pA;<esc><c-o>
nmap <space>il yiwgg3jo<esc>pASnip<c-space><tab><esc>zo<esc>
nmap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<cr>
nmap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<cr>class
nmap <space>lc ggVGd:w<cr>
nmap <space>lf :%s/\/var\/www\/html\///g<cr>
nmap <space>lr :edit!<cr>G
nmap <space>lo :tabnew ~/Projects/personio/personio/app/storage-local/logs/laravel.log<cr>:exec WatchForChanges("*", {'autoread':1})<cr>

nnoremap <space>ed :call phpfunctions#UpdatePhpDocIfExists()<cr>/End function<cr>bhD<c-o>
nnoremap cfp :call phpfunctions#CopyPhpClassFullPath()<cr><c-o>
