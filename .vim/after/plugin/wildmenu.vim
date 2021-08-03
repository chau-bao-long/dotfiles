call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

autocmd CmdlineEnter * ++once call s:wilder_init()

call wilder#set_option('modes', ['/', '?', ':'])

function! s:wilder_init() abort
  call wilder#set_option('pipeline', [
        \   wilder#debounce(10),
        \   wilder#branch(
        \     [
        \       wilder#check({_, x -> empty(x)}),
        \       wilder#history(),
        \       wilder#result({
        \         'draw': [{_, x -> ' ' . x}],
        \       }),
        \     ],
        \     wilder#python_file_finder_pipeline({
        \       'file_command': ['rg', '--files'],
        \       'dir_command': ['fd', '-td'],
        \       'filters': ['fuzzy_filter', 'difflib_sorter'],
        \     }),
        \     wilder#cmdline_pipeline({
        \       'fuzzy': 1,
        \       'sorter': wilder#python_difflib_sorter(),
        \     }),
        \     wilder#python_search_pipeline({
        \       'pattern': 'fuzzy',
        \     }),
        \   ),
        \ ])

  call wilder#set_option('renderer', wilder#renderer_mux({
        \ ':': wilder#popupmenu_renderer({
        \   'highlighter': s:highlighters,
        \   'left': [
        \     wilder#popupmenu_devicons(),
        \   ],
        \   'right': [
        \     ' ',
        \     wilder#popupmenu_scrollbar(),
        \   ],
        \ }),
        \ '/': wilder#wildmenu_renderer({
        \   'highlighter': s:highlighters,
        \ }),
        \ }))
endfunction
