nnoremap <space>ee :call javafunctions#runOneTest(0, "--info")<cr>
nnoremap <space>eE :call javafunctions#runOneTest(1, "--info")<cr>
nnoremap <space>ef :call javafunctions#runAllTestsInFile(0, "--info")<cr>
nnoremap <space>eF :call javafunctions#runAllTestsInFile(1)<cr>
nnoremap <leader>gi :Rg override fun <C-R><C-W><CR>
nnoremap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<CR>
nnoremap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<CR>class
nnoremap <space>ip :call javafunctions#generatePackage()<cr>

nmap gf :GoToFile<cr>
nmap gT :GoToFile tabedit<cr>

" Easy switching between vim and intelliJ
nnoremap <silent> <space>oi :exec "Dispatch! idea --line " . line('.') . " " . expand('%:p')<cr>

" No delay switch to intelliJ with exact cursor position on the same file
nnoremap go :call comrade#buffer#SyncCursor()<cr>:call system("yabai -m window --swap west \|\| yabai -m window --swap east && yabai -m window --focus west")<cr>
" nnoremap go :call comrade#buffer#SyncCursor()<cr>:call system("yabai -m space --focus 3")<cr>

nnoremap <space>si :VintellijSuggestImports<cr>

nnoremap [s :ComradePrevInsight<cr>
nnoremap ]s :ComradeNextInsight<cr>
