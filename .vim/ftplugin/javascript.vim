nmap <space>elp :Dispatch! cd %:p:h && prettier --write **/*.*<cr>
nmap <space>elP :Dispatch! prettier --write **/*.*<cr>
nmap <space>elc :Dispatch eslint %:p:h<cr>
nmap <space>elC :Dispatch pwd \| xargs eslint<cr>
nmap <space>elf :Dispatch eslint --fix --max-warnings 7 %:p:h<cr>
nmap <space>elf :Dispatch pwd \| xargs eslint --fix --max-warnings 7 <cr>
nmap <space>ef :Dispatch ./node_modules/.bin/jest % && read<cr>:!tmux swap-pane -D \; select-pane -U<cr>
nmap <space>eF :Dispatch node --inspect-brk --inspect ./node_modules/.bin/jest --runInBand %<cr>
nmap <space>elt :Dispatch ./node_modules/.bin/flow %;read<cr>
