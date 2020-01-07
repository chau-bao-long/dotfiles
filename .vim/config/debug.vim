" Vdebug
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9001
nmap <space>de :VdebugEval 
nmap <space>dt :VdebugTrace 
vmap <space>de y:VdebugEval <C-R>0<CR>
vmap <space>dt y:VdebugTrace <C-R>0<CR>

" Vebugger
map <space>da :call vebugger#jdb#attach('localhost:5005', {'srcpath':['~/Projects/personio/admin-panel-service/app/src/test/kotlin']})<CR>:sleep 500m<CR>:VBGcontinue<CR>
map <space>dA :call vebugger#jdb#attach('localhost:5005', {'srcpath':['~/Projects/personio/admin-panel-service/app/src/main/kotlin']})<CR>:sleep 500m<CR>:VBGcontinue<CR>
map <space>db :VBGtoggleBreakpointThisLine<CR>
map <space>d2 :VBGstepOver<CR>
map <space>d3 :VBGstepIn<CR>
map <space>d4 :VBGstepOut<CR>
map <space>d5 :VBGcontinue<CR>
map <space>d6 :VBGkill<CR>
map <space>d; :VBGtoggleTerminalBuffer<CR>
map <space>dw :VBGrawWrite 
map <space>ds :VBGrawWrite list<CR>
map <space>dj :VBGeval 
map <space>dk :VBGevalWordUnderCursor<CR>
map <space>dl :VBGevalSelectedText<CR>
