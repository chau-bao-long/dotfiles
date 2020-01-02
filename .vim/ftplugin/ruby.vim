let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
nmap <space>ef :call RunCurrentSpecFile()<CR>
nmap <space>ee :call RunNearestSpec()<CR>
nmap <space>et :call RunLastSpec()<CR>
nmap <space>ea :call RunAllSpecs()<CR>
nmap <space>elc :Dispatch rubocop --require rubocop-airbnb -a<CR> 
