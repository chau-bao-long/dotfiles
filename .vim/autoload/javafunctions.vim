function! javafunctions#goToNearestGradleFolder()
  execute "silent! Rooter"
  let gradleRoot = system("rg --files | rg gradlew$ | sed 's\/gradlew.*\/\/g'")
  if len(trim(gradleRoot)) > 0
    execute 'chdir! ' . gradleRoot
  endif
endfunction

function! javafunctions#runOneTest(isDebug, ...)
  call javafunctions#goToNearestGradleFolder()
  execute "silent! normal! /fun \<cr>Nwvt(y"

  if a:isDebug 
    let debugCmd = "--debug-jvm"
  else
    let debugCmd = ""
  endif

  let arguments = get(a:, 1, "")

  let testcase = substitute(@0, '`', '', "g")
  let testcase = substitute(testcase, ' ', '*', "g")
  let testCmd = "./gradlew cleanTest test " . debugCmd . " " . arguments . " --tests " . expand('%:t')[:-4] . ".\\*" . testcase . "\\*"
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd" 

  call system(expand(l:keepCurrentCmd))

  execute "tabnew | terminal ~/bin/current-cmd"
  execute "normal! \<cr>G"
endfunction

function! javafunctions#runAllTestsInFile(isDebug, ...)
  call javafunctions#goToNearestGradleFolder()

  if a:isDebug 
    let debugCmd = "--debug-jvm"
  else
    let debugCmd = ""
  endif

  let arguments = get(a:, 1, "")

  let testCmd = "./gradlew cleanTest test " . debugCmd . " --info --tests " . expand('%:t')[:-4]
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd" 

  call system(expand(l:keepCurrentCmd))

  execute "tabnew | terminal ~/bin/current-cmd"
  execute "normal! \<cr>G"
endfunction
