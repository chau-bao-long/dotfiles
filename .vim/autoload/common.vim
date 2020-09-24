function! common#gotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

fu! common#openZipFilesFromClipboard(command)
  let clipboard = @*
  if clipboard =~ '^\s*$'
    let clipboard = @+
  endif

  let zipPath = split(clipboard, "!/")
  let classPath = split(zipPath[1], "::")[0]
  let lineNo = split(zipPath[1], "::")[1]
  let vimPath = "zipfile:" . zipPath[0] . "::" . classPath

  exe a:command . ' +' . lineNo . ' ' . vimPath
endfu

function! common#openFilesFromClipboard(command)
  let clipboard = @*
  if clipboard =~ '^\s*$'
    let clipboard = @+
  endif

  let path=s:correctPathOfJarFile(clipboard)

  let lines = split(path, "\n")
  for line in lines
    let ifile     = line
    let file_line = 0

    if ifile =~ ':'
      let file_parts = split(ifile, ':')

      let ifile = file_parts[0]

      if file_parts[1] =~ '^\d\+$'
        let file_line = file_parts[1]
      elseif file_parts[2] =~ '^\d\+$'
        let file_line = file_parts[2]
      endif
    endif

    if ifile =~ '^".\+"$'
      let ifile = strpart(ifile, 1, strlen(ifile)-1)
    endif

    execute a:command . ' ' printf('+%d', file_line) ifile
  endfor
endfunction

function! s:correctPathOfJarFile(path)
  let lines = split(a:path, "jar!")
  return len(lines) > 1 ? g:libPath . lines[1] : a:path
endfunction

function common#goBack()
  cd ..
  pwd
endfunction

function common#goBackToRoot()
  while stridx(execute(":!ls -a"), ".git") < 0 && strlen(execute(":pwd")) > 2
    cd ..
  endwhile
endfunction

function common#goToCurrentFile()
  cd %:p:h
  pwd
endfunction

function! common#google(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
        \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
        \ a:lucky ? 'btnI&' : '', q))
endfunction

fu! common#runCurrentCommand()
  if &filetype != ""
    tabnext
  end

  if &filetype == ""
    tabnew
    terminal ~/bin/current-cmd
    tabprevious
    tabclose
  else
    tabprevious
    tabnew
    terminal ~/bin/current-cmd
  end

  execute "normal G"
endfu

fu common#moveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfu

fu common#moveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfu
