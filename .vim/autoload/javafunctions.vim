function! javafunctions#openFile(command)
  let path = "~/Projects/lib/java"
  let projectPath = getcwd()

  if s:jumpToFileInSamePackage(a:command)
    return
  endif

  if s:jumpToExactMatchPath(a:command, path, projectPath)
    return
  else
    " try again to looking for import line corresponding to current word
    execute "silent! normal! /import .*" . expand('<cword>') . "$\<cr>$"

    if s:jumpToExactMatchPath(a:command, path, projectPath)
      return
    endif
  endif

  call s:jumpToFileByFuzzySearch(a:command, path)
endfunction

function s:jumpToExactMatchPath(command, libPath, projectPath)
  let words = split(getline('.'), '\W\+') " [import, org, spring, http, HttpStatus]
  let relativeSourcePath  = join(words[1:], '/') " words[1:] to remove the import word: org, spring, http, HttpStatus => result: org/spring/http/HttpStatus

  let javaLibPath = a:libPath . "/" . relativeSourcePath . '.java'
  let kotlinLibPath = a:libPath . "/" . relativeSourcePath . '.kt'
  let javaSrcPath = a:projectPath . "/app/src/main/kotlin/" . relativeSourcePath . '.java'
  let kotlinSrcPath = a:projectPath . "/app/src/main/kotlin/" . relativeSourcePath . '.kt'
  let javaTestPath = a:projectPath . "/app/src/test/kotlin/" . relativeSourcePath . '.java'
  let kotlinTestPath = a:projectPath . "/app/src/test/kotlin/" . relativeSourcePath . '.kt'

  for path in [javaLibPath, kotlinLibPath, javaSrcPath, kotlinSrcPath, javaTestPath, kotlinTestPath]
    if filereadable(expand(l:path))
      execute a:command . ' ' . path
      return 1
    endif 
  endfor

  return 0
endfunction

function s:jumpToFileInSamePackage(command)
  let javaPath = expand("%:p:h") . '/' . expand('<cword>') . '.java'
  let kotlinPath = expand("%:p:h") . '/' . expand('<cword>') . '.kt'

  for path in [javaPath, kotlinPath]
    if filereadable(expand(l:path))
      execute a:command . ' ' . path
      return 1
    endif
  endfor

  return 0
endfunction

function s:jumpToFileByFuzzySearch(command, path)
  let queryStringExactName = "find " . a:path . " -type f -name '" . expand('<cword>'). ".java' -o -name '" . expand('<cword>'). ".kt'"
  let resultsFromFind = system(expand(l:queryStringExactName))
  let results = split(resultsFromFind, "\n")
  if len(results) == 0
    let queryStringFuzzyTheEnd = "find " . a:path . " -type f -name '" . expand('<cword>'). "*'"
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
