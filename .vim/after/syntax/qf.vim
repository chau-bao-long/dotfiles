" refers color here
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim

highlight OK ctermbg=green
highlight Error ctermbg=red
highlight Success ctermfg=46
highlight Task ctermfg=214
highlight Info ctermfg=45
highlight Debug ctermfg=97
highlight Warn ctermfg=yellow
highlight Fail ctermfg=red
highlight Brace ctermfg=30
highlight Bracket ctermfg=138
highlight Tick ctermfg=grey

syn match OK " [oO][Kk] "
syn match Error ".* [eE][rR][Rr][oO][rR].*"
syn match Success ".*[Ss][Uu][Cc][Cc][Ee][Ss][Ss].*"
syn match Task "> .*"
syn match Info "[iI][nN][fF][oO]"
syn match Debug "[Dd][Ee][Bb][Uu][Gg]"
syn match Warn "[Ww][Aa][Rr][Nn]"
syn match Fail ".* [fF][aA][iI][Ll].*"
syn match Brace "(.*)"
syn match Bracket "\[.*\]"
syn match Tick "'.*'"
