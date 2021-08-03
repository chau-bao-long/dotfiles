nnoremap <space>5 :UndotreeToggle<cr>
nnoremap <space>l :CocCommand explorer --preset floating<cr>
" nnoremap <space>fe :CocCommand explorer<cr>
" nnoremap <space>fl :call <SID>findLocationOnTree()<cr>
nnoremap <space>fv :CocCommand explorer --preset .vim<cr>

autocmd Filetype coc-explorer :IndentLinesDisable

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\     'position': 'floating',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

fu s:findLocationOnTree()
  let l:lastWinId = win_getid(winnr())
  call nvim_win_close(win_getid(1), 0)
  call coc#rpc#notify('runCommand', ['explorer'])
  sleep 100m
  call win_gotoid(l:lastWinId)
endfu

let g:nvim_tree_side = 'left'
let g:nvim_tree_width = 45
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_tab_open = 0
let g:nvim_tree_auto_resize = 1
let g:nvim_tree_disable_netrw = 1
let g:nvim_tree_hijack_netrw = 1
let g:nvim_tree_add_trailing = 0
let g:nvim_tree_group_empty = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_hijack_cursor = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_symlink_arrow = ' ➛ '
let g:nvim_tree_update_cwd = 0
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <space>fe :NvimTreeToggle<CR>
nnoremap <space>fl :NvimTreeFindFile<CR>
