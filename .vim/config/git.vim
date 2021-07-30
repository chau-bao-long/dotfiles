nnoremap <space>gl :Gclog -n 100<cr>
nnoremap <space>gL :Gclog<cr>
nnoremap <space>g0l :0Glog -n 100<cr>
nnoremap <space>g0L :0Glog<cr>
nnoremap <space>gd :Gdiff HEAD<cr><c-w>l
nnoremap <space>gz :call <SID>closeGitDiffWindows()<cr>
nnoremap <space>gD :Gvdiffsplit!<cr>
nnoremap <space>gpr :Ggrep 
nnoremap <space>gr :Gread! 
nnoremap <space>gw :Gwrite<cr>
nnoremap <space>gbl :Git blame<cr>
nnoremap <space>gbr :GBrowse<cr>
nnoremap <space>gg :tabnew \| Git<cr><c-w>o
nnoremap <space>ge :Gedit 
nnoremap <space>gt .tabnew<cr>
nnoremap <space>gvs :Gvsplit<cr>
nnoremap <space>gsp :Gsplit<cr>
nnoremap <space>gpu :Gpush<cr>
nnoremap <space>gpf :Gpush -f<cr>
nnoremap <space>gfo :Gfetch origin<cr>
nnoremap <space>gpl :Gpull<cr>
nnoremap <space>gm <c-w>o:Gedit<cr>

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

nnoremap <space>go :DiffviewOpen<cr>
nnoremap <space>gc :DiffviewClose<cr>
