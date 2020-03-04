function! OpenFilesFromClipboard(command)
  let clipboard = @*
  if clipboard =~ '^\s*$'
    let clipboard = @+
  endif

  let lines = split(clipboard, "\n")
  for line in lines
    let ifile     = line
    let file_line = 0

    if ifile =~ ':'
      let file_parts = split(ifile, ':')

      let ifile = file_parts[0]

      if file_parts[1] =~ '^\d\+$'
        let file_line = file_parts[1]
      endif
    endif

    if ifile =~ '^".\+"$'
      let ifile = strpart(ifile, 1, strlen(ifile)-1)
    endif

    execute a:command . ' ' printf('+%d', file_line) ifile
  endfor

endfunction

nnoremap <space>ot :call OpenFilesFromClipboard("tabnew")<cr>
nnoremap <space>oo :call OpenFilesFromClipboard("e")<cr>
nnoremap <space>os :call OpenFilesFromClipboard("split")<cr>
nnoremap <space>ov :call OpenFilesFromClipboard("vs")<cr>
