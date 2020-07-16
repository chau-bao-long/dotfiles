nmap <space>ee /it('<cr>Nwwyt':!echo ./node_modules/.bin/jest % -t \"<c-r>0\" > ~/bin/current-cmd<cr>:tabnew \| terminal ~/bin/current-cmd<cr>G
nmap <space>eE /it('<cr>Nwwyt':!echo node --inspect-brk --inspect ./node_modules/.bin/jest % -t \"<c-r>0\" > ~/bin/current-cmd<cr>:tabnew \| terminal ~/bin/current-cmd<cr>G
nmap <space>ef :!echo ./node_modules/.bin/jest % > ~/bin/current-cmd<cr>:tabnew \| terminal ~/bin/current-cmd<cr>G
nmap <space>eF :Dispatch node --inspect-brk --inspect ./node_modules/.bin/jest --runInBand %<cr>
nmap <space>eW :tabnew \| terminal yarn test:watch<cr>
