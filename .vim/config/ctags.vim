function CtagsRubyIncludeLib()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)
endfunction

function CtagsRuby()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log .
endfunction

function CtagsJSIncludeLib()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=dist --exclude=log .
endfunction

function CtagsJS()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=log --exclude=node_modules --exclude=dist .
endfunction

function CtagsPythonIncludeLib()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log . $(pip show pip | grep Location | cut -d ":" -f 2)
endfunction

function CtagsPython()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log .
endfunction

function CtagsPHP()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=PHP --exclude=.git --exclude=log .
endfunction

function CtagsKotlin()
    call GoBackToRoot()
    Dispatch! ctags -R --languages=kotlin --exclude=.git --exclude=log --exclude=.gradle --exclude=.gradle-home --exclude=data .
endfunction

map <space>cr :call CtagsRubyIncludeLib()<CR>
map <space>cR :call CtagsRuby()<CR>
map <space>cp :call CtagsPythonIncludeLib()<CR>
map <space>cP :call CtagsPython()<CR>
map <space>cj :call CtagsJSIncludeLib()<CR>
map <space>cJ :call CtagsJS()<CR>
map <space>ch :call CtagsPHP()<CR>
map <space>ck :call CtagsKotlin()<CR>
