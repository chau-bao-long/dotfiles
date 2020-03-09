function! javafunctions#openFile(command)
  let path = "~/Projects/lib/java"
  let canJump = s:jumpToExactMatchPath(a:command, path)

  if canJump == 0
    " try again to looking for import line corresponding to current word
    execute "silent! normal! /import .*" . expand('<cword>') . "$\<cr>"
    let canJump = s:jumpToExactMatchPath(a:command, path)
    if canJump == 1
      return
    endif
  endif

  let queryStringExactName = "find " . path . " -type f -name '" . expand('<cword>'). ".java' -o -name '" . expand('<cword>'). ".kt'"
  let resultsFromFind = system(expand(l:queryStringExactName))
  let results = split(resultsFromFind, "\n")
  if len(results) == 0
    let queryStringFuzzyTheEnd = "find " . path . " -type f -name '" . expand('<cword>'). "*'"
    let resultsFromFind = system(expand(l:queryStringFuzzyTheEnd))
    let results = split(resultsFromFind, "\n")
    if len(results) == 0
      echom "Not found any source map with name: " . expand('<cword>')
    elseif len(results) == 1
      execute ":tabedit " results[0]
      execute a:command . ' ' . results[0]
    else
      " open a fuzzy finder helping user choose the file with type of 'CurrentWord*' which has more than 2 results found
      call fzf#run(fzf#wrap({'source': expand(l:queryStringFuzzyTheEnd)}))
    endif
  elseif len(results) == 1
    execute a:command . ' ' . results[0]
  else
    " open a fuzzy finder helping user choose the file with type of 'CurrentWord*' which has more than 2 results found
    call fzf#run(fzf#wrap({'source': expand(l:queryStringExactName)}))
  endif
endfunction

function s:jumpToExactMatchPath(command, path)
  let words = split(getline('.'), '\W\+') " [import, org, spring, http, HttpStatus]
  let relativeSourcePath  = join(words[1:], '/') " words[1:] to remove the import word: org, spring, http, HttpStatus => result: org/spring/http/HttpStatus
  let absoluteJavaSourcePath = a:path . "/" . relativeSourcePath . '.java'
  let absoluteKotlinSourcePath = a:path . "/" . relativeSourcePath . '.kt'
  if filereadable(expand(l:absoluteJavaSourcePath)) " check file exists then open it up
    execute a:command . ' ' . absoluteJavaSourcePath
    return 1
  elseif filereadable(expand(l:absoluteKotlinSourcePath)) " check file exists then open it up
    execute a:command . ' ' . absoluteKotlinSourcePath
    return 1
  else
    return 0
  endif
endfunction
