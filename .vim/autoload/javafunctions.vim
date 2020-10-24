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

  call common#runCurrentCommand()
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

  call common#runCurrentCommand()
endfunction

fu! javafunctions#generatePackage()
  let l:hasPackage = search("package")

  if l:hasPackage
    call deletebufline(bufnr(), 1, 1)
  end

  let l:path = substitute(expand("%:p:h"), ".*main\/kotlin\/", "", "")
  let l:path = substitute(l:path, ".*test\/kotlin\/", "", "")
  let l:path = substitute(l:path, "\/", "\.", "g")
  let l:path = substitute(l:path, "\^", "package ", "")
  call appendbufline(bufnr(), 0, l:path)

  if !l:hasPackage
    call appendbufline(bufnr(), 1, "")
    call appendbufline(bufnr(), 2, "class ". expand("%:t:r"))
    exe "normal! 3GA"
  end
endfu
