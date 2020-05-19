set guicursor=n:blinkon1
set updatetime=300
set shortmess+=c

" \'coc-tag',
let g:global_extensions = [
            \'coc-ultisnips',
            \'coc-tabnine',
            \'coc-phpls',
            \'coc-json',
            \'coc-tsserver',
            \'coc-css',
            \'coc-html',
            \'coc-solargraph',
            \'coc-yaml',
            \'coc-python',
            \'coc-svg',
            \'coc-flow',
            \'coc-go'
            \]

" Improve the completion experience
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window
nnoremap <space>ad :call <SID>show_documentation()<CR>

nnoremap <silent> <space>ay  :<C-u>CocList -A --normal yank<cr>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>aa  :CocFzfList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ae  :CocFzfList extensions<cr>
" Show commands
nnoremap <silent> <space>ac  :CocFzfList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>ao  :CocFzfList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>as  :CocFzfList symbols<cr>
" Actions
nnoremap <silent> <space>af  :CocFzfList actions<cr>
" Do default action for next item.
nnoremap <silent> <space>aj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ak  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>ap  :<C-u>CocListResume<cr>
" Coc source config file
nnoremap <space>al :source ~/Projects/dotfiles/.vim/config/coc.vim<cr>

" Delay load coc config again, which fix the bug with coc completion does not work at first time start
autocmd VimEnter * call timer_start(200, { tid -> execute('source ~/Projects/dotfiles/.vim/config/coc.vim')})
