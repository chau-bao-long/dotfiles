fu! s:closeGitDiffWindows()
  let rightestWin = win_getid(4)
  let secondWin = win_getid(2)

  if rightestWin != 0
    call nvim_win_close(rightestWin, 0)
  endif

  if secondWin != 0
    call nvim_win_close(secondWin, 0)
  endif

  exe "normal \<c-w>h"
endfu
