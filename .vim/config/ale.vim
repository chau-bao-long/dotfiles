let g:ale_linters = {
      \  'javascript': ['eslint', 'flow'],
      \  'ruby': ['rubocop'],
      \  'kotlin': ['ktlint'],
      \}
let g:ale_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '⛄'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⛄ %d', '⚠ %d', '']
let g:ale_echo_msg_format = '%linter%: %s'

nnoremap ]a :ALENextWrap<cr>
nnoremap [a :ALEPreviousWrap<cr>
nmap <leader>at :ALEToggle<CR>
