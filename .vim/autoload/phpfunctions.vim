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

let g:phpUnitBin = './vendor/bin/phpunit'

fu! phpfunctions#runOneTest()
  exe "silent! normal! /public function \<cr>Nwwvey"
  let testCmd = g:phpUnitBin . " " . expand('%:p') . " --filter " . @0
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu

fu! phpfunctions#runAllTestsInFile()
  let testCmd = g:phpUnitBin . " " . expand('%:p')
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu

fu! phpfunctions#generatePhpDirectiveAndNamespace()
  let l:hasNamespace = search("namespace")

  if l:hasNamespace
    call deletebufline(bufnr(), 1, 3)
  end

  call appendbufline(bufnr(), 0, "<?php")
  let l:path = substitute(expand("%:p:h"), getcwd() . "/", "", "")
  let l:path = substitute(l:path, "\/", "\\", "g")
  let l:path = substitute(l:path, "\^", "namespace ", "")
  let l:path = substitute(l:path, "\$", "; ", "")
  call appendbufline(bufnr(), 2, l:path)

  if !l:hasNamespace
    call appendbufline(bufnr(), 3, "")
    call appendbufline(bufnr(), 4, "class " . expand("%:t:r"))
    exe "normal! ggjjwvU"
    exe "normal! GA"
  else
    exe "normal! ggjjwvUo"
  end
endfu

fu! phpfunctions#runOneTestOnContainer()
  exe "silent! normal! /public function \<cr>Nwwvey"
  let container = trim(system("kubectl get pods | awk '{print $1}' | grep 'web'"))
  let testCmd = "kubectl exec " . container . " -- ./vendor/bin/phpunit " . expand('%F') . " --filter " . @0
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu

fu! phpfunctions#runAllTestsInFileOnContainer()
  let container = trim(system("kubectl get pods | awk '{print $1}' | grep 'web'"))
  let testCmd = "kubectl exec " . container . " -- ./vendor/bin/phpunit " . expand('%F')
  let keepCurrentCmd = "echo \"" . testCmd . "\" > ~/bin/current-cmd"
  call system(expand(l:keepCurrentCmd))
  call common#runCurrentCommand()
endfu
