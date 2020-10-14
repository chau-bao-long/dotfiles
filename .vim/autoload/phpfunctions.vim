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

fu! phpfunctions#generatePhpDirectiveAndNamespace()
  let l:hasNamespace = search("namespace")

  if l:hasNamespace
    call deletebufline(bufnr(), 1, 3)
  end

  call appendbufline(bufnr(), 0, "<?php")
  let l:folderPath = expand("%:h")
  let l:path = substitute(expand("%:h"), getcwd(), "", "")
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
