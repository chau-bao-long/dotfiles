function! phpfunctions#CopyPhpClassFullPath()
  execute "silent! normal! /namespace\<cr>wyt;"
  let @+=@0 . '\' . expand('%:t:r')
endfunction

function! phpfunctions#UpdatePhpDocIfExists()
  normal! k
  if getline('.') =~ '/'
    normal! V%d
  else
    normal! j
  endif
  call PhpDocSingle()
  normal! k^%k$
  if getline('.') =~ ';'
    exe "normal! $svoid"
  endif
endfunction

fu! phpfunctions#runOneTest()
  exe "silent! normal! /public function \<cr>Nwwvey"
  let testCmd = "phpunit " . expand('%:p') . " --filter " . @0
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu

fu! phpfunctions#runAllTestsInFile()
  let testCmd = "phpunit " . expand('%:p')
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu
