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

nnoremap go :VintellijOpenFile<cr>
nnoremap <space>si :VintellijSuggestImports<cr>
nnoremap <space>v- :VintellijSyncBufferToggle<cr>
nnoremap <space>v_ :VintellijSyncBufferToggle!<cr>
nnoremap [s :ComradePrevInsight<cr>
nnoremap ]s :ComradeNextInsight<cr>
