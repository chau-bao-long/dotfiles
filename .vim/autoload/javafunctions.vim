function! javafunctions#openFile(command)
  " Handle for the case the cursor is at `import` line - current limit is only open java, but happy case is if not found then trying to find a file name match to current word -> the result is mostly kotlin
  " getline('.') import org.springframework.http.HttpStatus
  let path = "~/Projects/lib/java"
  let words = split(getline('.'), '\W\+') " [import, org, spring, http, HttpStatus]
  let buildRelativeSourcePath  = join(words[1:], '/') " words[1:] to remove the import word: org, spring, http, HttpStatus => result: org/spring/http/HttpStatus
  let absoluteSourcePath = path . "/" . buildRelativeSourcePath . '.java'
  " expand(l:absoluteSourcePath) => filereadabl accepts a string => this is to turn absoluteSourcePath to a string
  if filereadable(expand(l:absoluteSourcePath)) " check file exists then open it up
    execute a:command . ' ' . absoluteSourcePath
  else
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
  endif
endfunction
