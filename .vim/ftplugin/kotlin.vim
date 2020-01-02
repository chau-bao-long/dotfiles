nmap <space>ee /@Test<cr>Njwvt(y:exec "Dispatch echo \"~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . ".\\*<c-r>0\\* \" > ~/bin/current-cmd"<cr><space>eq
nmap <space>eE /@Test<cr>Njwvt(y:exec "Dispatch echo \"~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . ".\\*<c-r>0\\* \" > ~/bin/current-cmd"<cr><space>eq
vmap <space>ee y:exec "Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . ".\\*<C-R>0\\*"<CR>
vmap <space>eE y:exec "Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . ".\\*<C-R>0\\*"<CR>
nmap <space>ef :exec "Dispatch echo ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --info --tests " . expand('%:t')[:-4] . " > ~/bin/current-cmd"<cr><space>eq
nmap <space>eF :exec "Dispatch echo ~/Projects/personio/admin-panel-service/run.sh gradlew cleanTest test --debug-jvm --info --tests " . expand('%:t')[:-4] . " > ~/bin/current-cmd"<cr><space>eq
nmap <space>ek :Dispatch! ~/Projects/personio/admin-panel-service/run.sh reload<cr>
nmap <space>eK :Dispatch ~/Projects/personio/admin-panel-service/run.sh reload<cr>
nmap <space>ec :Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew clean<cr>
nmap <space>eb :Dispatch ~/Projects/personio/admin-panel-service/run.sh gradlew build<cr>
nmap <space>gi :Rg override fun <C-R><C-W><CR>
nmap <space>gI :exec "/I" . expand('%:t:r')<CR>n<c-]>
nmap <space>gt :exec "Rg " . expand('%:t:r') . "Test"<CR>
nmap <space>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<CR>class
nmap <space>il yiwggjo<esc>pA<c-space><tab><esc>zo
nmap <space>is "1yiw<c-]>ggwvE"2y<c-o><c-o>ggjoimport <esc>"2pA.<esc>"1p<c-o>
nmap <space>ip :!echo %:p:h \| sed 's/\//\./g' \| grep -o 'kotlin\.main\..*' \| sed 's/kotlin\.//g' \| sed 's/^/package /' >> %<CR>:e!<CR>
nmap <space>elc :Dispatch ktlint<cr>
nmap <space>elf :Dispatch! ktlint -F<cr>
nmap <leader>gt :Files<cr>test
nmap <leader>ga :Files<cr>actions
nmap <leader>gr :Files<cr>respositories
nmap <leader>ge :Files<cr>endpoints
nmap <leader>gf :Files<cr>factories
