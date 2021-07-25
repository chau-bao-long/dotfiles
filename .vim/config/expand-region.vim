nnoremap ) <Plug>(expand_region_expand)
nnoremap ( <Plug>(expand_region_shrink)

call expand_region#custom_text_objects('ruby', {
      \ 'im' :0,
      \ 'am' :0,
      \ })

call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })
vnoremap <s-k> :call <sid>decreaseSize()<cr>:call <sid>updateVisualArea()<cr>
vnoremap <s-j> :call <sid>increaseSize()<cr>:call <sid>updateVisualArea()<cr>

vnoremap <c-[> <c-[>:call <sid>resetExpandRange()<cr>

let s:from = -1
let s:to = -1
let s:numberOfCall = 0
let s:fromLine = 0
let s:toLine = 0

function s:resetExpandRange()
  let s:from = -1
  let s:to = -1
  let s:numberOfCall = 0
endfunction

function s:initFromToPos()
  if get(s:, 'from', -1) == -1
    let s:from = getpos("'<")[1]
    let s:to = getpos("'>")[1]
  endif
endfunction

function s:decreaseSize()
  call s:initFromToPos()

  let s:numberOfCall += 1

  if s:numberOfCall >= (s:to - s:from + 1)
    let s:fromLine = s:from + 1
    let s:toLine = s:to - 1
    call s:resetExpandRange()
  end
endfunction

function s:increaseSize()
  call s:initFromToPos()

  let s:numberOfCall += 1

  if s:numberOfCall >= (s:to - s:from + 1)
    let s:fromLine = s:from - 1
    let s:toLine = s:to + 1
    call s:resetExpandRange()
  end
endfunction

function s:updateVisualArea()
  call setpos("'<", [bufnr(), s:fromLine, 0])
  call setpos("'>", [bufnr(), s:toLine, 9999])

  normal! gv
endfunction
