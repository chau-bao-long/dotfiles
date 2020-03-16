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
