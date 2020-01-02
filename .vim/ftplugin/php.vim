nmap <space>ee /public function<cr>Nwwvey:!echo phpunit % --filter <c-r>0 > ~/bin/current-cmd<cr>:Dispatch phpunit % --filter <c-r>0<cr>
nmap <space>eE :Dispatch phpunit %<cr>
nmap <space>ip :!echo "<?php" >> % && echo "" >> % && echo %:h \| sed 's/\//\\/g' \| sed 's/^/namespace /' \| sed 's/$/; /' >> %<CR>:e!<CR>2jwvUGo<CR>
nmap <space>is "1yiw<c-]>gg2jwvEh"2y<c-o><c-o>gg3jouse <esc>"2pA\<esc>"1pA;<esc><c-o>
nmap <space>io yiwgg3jouse <esc>pA;<esc><c-o>
nmap <space>il yiwgg3jo<esc>pASnip<c-space><tab><esc>zo<esc>
nmap <space>gt :exec "Rg " . expand('%:t:r') . "Test"<cr>
nmap <space>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<cr>class
nmap <leader>gr :Rg route<cr>
nmap <leader>gc :Rg controllers<cr>
nmap <leader>gm :Rg models<cr>
nmap <leader>gd :Rg repositories<cr>
nmap <leader>gs :Rg services<cr>
nmap <leader>gt :Rg test<cr>
