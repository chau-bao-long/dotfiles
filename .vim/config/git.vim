nmap <space>gl :Glog -n 100<cr>
nmap <space>gL :Glog<cr>
nmap <space>g0l :0Glog -n 100<cr>
nmap <space>g0L :0Glog<cr>
nmap <space>gdd :Gdiff<cr><c-w>l
nmap <space>gds :Gvdiffsplit!<cr>
nmap <space>gpr :Ggrep 
nmap <space>gr :Gread! 
nmap <space>gw :Gwrite<cr>
nmap <space>gbl :Gblame<cr>
nmap <space>gbr :Gbrowse<cr>
nmap <space>gs :Gstatus<cr>
nmap <space>gg :Gstatus<cr><c-w>o
nmap <space>ge :Gedit 
nmap <space>gt .tabnew<cr>
nmap <space>gvs :Gvsplit<cr>
nmap <space>gsp :Gsplit<cr>
nmap <space>gca :Gcommit --amend<cr>
nmap <space>gci :Gcommit<cr>
nmap <space>gpu :Gpush<cr>
nmap <space>gpf :Gpush -f<cr>
nmap <space>gfo :Gfetch origin<cr>
nmap <space>gpl :Gpull<cr>
nmap <space>gz :GitGutterFold<cr>
nmap <space>g- :GitGutterEnable<cr>
nmap <space>g_ :GitGutterDisable<cr>
nmap <space>gh :GitGutterLineHighlightsToggle<cr>
nmap <space>gj :GitGutterPreviewHunk<cr>
nmap <space>g] 'tjO
nmap <space>g[ 'tkO
nmap ]d 'tjO:Gdiff<cr><c-w>l
nmap [d 'tkO:Gdiff<cr><c-w>l
nmap <space>g, [c:GitGutterPreviewHunk<cr>
nmap <space>g. ]c:GitGutterPreviewHunk<cr>
nmap <space>gm <c-w>o:Gedit<cr>
nmap <space>go :tabnew<cr><c-o>:Gedit<cr>:NERDTreeFind<cr><c-w>l
nmap <space>gu :GitGutterUndoHunk<cr>

let g:gitgutter_enabled = 0
