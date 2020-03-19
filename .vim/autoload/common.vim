function! common#gotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

function! common#openFilesFromClipboard(command)
  let clipboard = @*
  if clipboard =~ '^\s*$'
    let clipboard = @+
  endif

  let lines = split(clipboard, "\n")
  for line in lines
    let ifile     = line
    let file_line = 0

    if ifile =~ ':'
      let file_parts = split(ifile, ':')

      let ifile = file_parts[0]

      if file_parts[1] =~ '^\d\+$'
        let file_line = file_parts[1]
      elseif file_parts[2] =~ '^\d\+$'
        let file_line = file_parts[2]
      endif
    endif

    if ifile =~ '^".\+"$'
      let ifile = strpart(ifile, 1, strlen(ifile)-1)
    endif

    execute a:command . ' ' printf('+%d', file_line) ifile
  endfor
endfunction

function common#goBack()
  cd ..
  pwd
endfunction

function common#goBackToRoot()
  while stridx(execute(":!ls -a"), ".git") < 0 && strlen(execute(":pwd")) > 2
    cd ..
  endwhile
  pwd
endfunction

function common#goToCurrentFile()
  cd %:p:h
  pwd
endfunction
