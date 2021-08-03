function! Profiling(bang)
  if a:bang
    profile pause
    noautocmd qall
    echo "Profiling ended"
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
    echo "Profiling Started"
  endif
endfunction

command! -bang StartProfiling call Profiling(<bang>0)
