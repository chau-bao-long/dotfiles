" refers color here
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim

highlight OK ctermbg=green
highlight Error ctermbg=red
highlight BuildSucessful ctermfg=46
highlight Task ctermfg=214
highlight Info ctermfg=74
highlight Debug ctermfg=97
highlight Warn ctermfg=100
highlight Fail ctermfg=red

syn match OK " [oO][Kk] "
syn match Error ".* [eE][rR][Rr][oO][rR].*"
syn match BuildSucessful "BUILD SUCCESSFUL"
syn match Task "> .*"
syn match Info "[iI][nN][fF][oO]"
syn match Debug "[Dd][Ee][Bb][Uu][Gg]"
syn match Warn "[Ww][Aa][Rr][Nn]"
syn match Fail ".* [fF][aA][iI][Ll].*"
