" refers color here
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
" https://jonasjacek.github.io/colors/

highlight OK ctermbg=green guibg=#5fff5f
highlight Error ctermbg=red guibg=#ff0000
highlight Success ctermfg=46 guifg=#00ff00
highlight Task ctermfg=214 guifg=#ffaf00
highlight Info ctermfg=45 guifg=#00d7ff
highlight Debug ctermfg=97 guifg=#875faf
highlight Warn ctermfg=yellow guifg=#ffff00
highlight Fail ctermfg=red guifg=#00ff00
highlight Brace ctermfg=30 guifg=#008787
highlight Bracket ctermfg=138 guifg=#af8787
highlight Tick ctermfg=grey guifg=#808080
highlight Run cterm=bold ctermfg=232 ctermbg=208 guifg=#080808 guibg=#ff8700
highlight Pass cterm=bold ctermfg=232 ctermbg=190 guifg=#080808 guibg=#d7ff00
highlight Total cterm=bold ctermfg=232 ctermbg=81 guifg=#080808 guibg=#5fd7ff

syn match OK " [oO][Kk] "
syn match Error " [eE][rR][Rr][oO][rR][sS ]"
syn match Success " [Ss][Uu][Cc][Cc][Ee][Ss][Ss].*"
syn match Task "> .*"
syn match Info "[iI][nN][fF][oO]"
syn match Debug "[Dd][Ee][Bb][Uu][Gg]"
syn match Warn "[Ww][Aa][Rr][Nn]"
syn match Fail ".* [fF][aA][iI][Ll].*"
syn match Brace "(.*)"
syn match Bracket "\[.*\]"
syn match Tick "'.*'"
syn match Run "[rR][uU][nN][sS ]"
syn match Pass "[pP][aA][sS][sS]"
syn match Total "[Tt][oO][tT][aA][lL]"
