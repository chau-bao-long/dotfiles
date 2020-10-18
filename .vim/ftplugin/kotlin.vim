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

nnoremap <silent> [s :ComradePrevInsight<cr>
nnoremap <silent> ]s :ComradeNextInsight<cr>
