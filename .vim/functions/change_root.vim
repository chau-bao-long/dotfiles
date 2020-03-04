function GoBack()
  cd ..
  pwd
endfunction

function GoBackToRoot()
  while stridx(execute(":!ls -a"), ".git") < 0 && strlen(execute(":pwd")) > 2
    cd ..
  endwhile
  pwd
endfunction

function GoToCurrentFile()
  cd %:p:h
  pwd
endfunction

