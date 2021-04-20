nnoremap <space>gl :Glog -n 100<cr>
nnoremap <space>gL :Glog<cr>
nnoremap <space>g0l :0Glog -n 100<cr>
nnoremap <space>g0L :0Glog<cr>
nnoremap <space>gd :Gdiff HEAD<cr><c-w>l
nnoremap <space>gz :call nvim_win_close(win_getid(2), 0)<cr><c-w>h
nnoremap <space>gD :Gvdiffsplit!<cr>
nnoremap <space>gpr :Ggrep 
nnoremap <space>gr :Gread! 
nnoremap <space>gw :Gwrite<cr>
nnoremap <space>gbl :Gblame<cr>
nnoremap <space>gbr :Gbrowse<cr>
nnoremap <space>gs :Gstatus<cr>
nnoremap <space>gg :Gstatus<cr><c-w>o
nnoremap <space>ge :Gedit 
nnoremap <space>gt .tabnew<cr>
nnoremap <space>gvs :Gvsplit<cr>
nnoremap <space>gsp :Gsplit<cr>
nnoremap <space>gca :Gcommit --amend<cr>
nnoremap <space>gci :Gcommit<cr>
nnoremap <space>gpu :Gpush<cr>
nnoremap <space>gpf :Gpush -f<cr>
nnoremap <space>gfo :Gfetch origin<cr>
nnoremap <space>gpl :Gpull<cr>
nnoremap ]w 't:tabfirst<cr>jO
nnoremap [w 't:tabfirst<cr>kO
nnoremap ]d 't:tabfirst<cr>jO:Gdiff<cr><c-w>l
nnoremap [d 't:tabfirst<cr>kO:Gdiff<cr><c-w>l
nnoremap <space>gm <c-w>o:Gedit<cr>
