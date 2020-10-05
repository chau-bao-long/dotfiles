nmap <space>ee :call javafunctions#runOneTest(0, "--info")<cr>
nmap <space>eE :call javafunctions#runOneTest(1, "--info")<cr>
nmap <space>ef :call javafunctions#runAllTestsInFile(0, "--info")<cr>
nmap <space>eF :call javafunctions#runAllTestsInFile(1)<cr>
nmap <leader>gi :Rg override fun <C-R><C-W><CR>
nmap <leader>gt :exec "Rg " . expand('%:t:r') . "Test"<CR>
nmap <leader>gc :exec "Rg " . substitute(expand('%:t:r'), 'test', '', 'g')<CR>class
nmap <space>ip :!echo %:p:h \| sed 's/\//\./g' \| grep -o 'kotlin\.main\..*' \| sed 's/kotlin\.//g' \| sed 's/^/package /' >> %<CR>:e!<CR>

" Easy switching between vim and intelliJ
nnoremap <silent> <space>oi :exec "Dispatch! idea --line " . line('.') . " " . expand('%:p')<cr>

command! -bang VintellijEnableAutoRefreshFile call vintellij#EnableAutoRefreshFile(<bang>0)
command! -bang VintellijEnableHealthCheckOnLoad call vintellij#EnableHealthCheckOnLoad(<bang>0)

if get(g:, 'vintellij_refresh_on_save', 1) == 1
  VintellijEnableAutoRefreshFile
endif

if get(g:, 'vintellij_health_check_on_load', 1) == 1
  VintellijEnableHealthCheckOnLoad
endif

nnoremap gd :call vintellij#GoToDefinition()<cr>
nnoremap go :call vintellij#OpenFile()<cr>
nnoremap gr :call vintellij#FindUsage()<cr>
nnoremap <space>gi :call vintellij#FindHierarchy()<cr>
nnoremap <space>si :call vintellij#SuggestImports()<cr>

set omnifunc=vintellij#Autocomplete

call deoplete#enable()
