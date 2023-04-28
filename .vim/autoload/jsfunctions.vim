fu! jsfunctions#runOneTest(isDebug)
  exe "silent! normal! /it('\<cr>Nwwyt'"
  let testCmd = "jest " . expand('%:p') . " -t '" . @0 . "'"

  if a:isDebug
    let testCmd = "node --inspect-brk --inspect " . testCmd
  endif

  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu

fu! jsfunctions#runAllTestsInFile(isDebug)
  let testCmd = "jest " . expand('%:p')

  if a:isDebug
    let testCmd = "node --inspect-brk --inspect " . testCmd
  endif

  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu
