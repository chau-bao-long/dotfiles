" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let g:coc_watch_extensions = ['coc-explorer']
set guicursor=n:blinkon1
set updatetime=300
set shortmess+=c

let g:global_extensions = [
            \'coc-fzf-preview',
            \'coc-explorer',
            \'coc-ultisnips',
            \'coc-highlight',
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
            \'coc-go',
            \'coc-lua'
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
nnoremap <c-space> viwA*<backspace>

nnoremap [s :call CocAction('diagnosticPrevious')<cr>
nnoremap ]s :call CocAction('diagnosticNext')<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <space>ca <Plug>(coc-codeaction)

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Using CocList
" Show all coc list in fzf
nnoremap <silent> <space>af  :CocFzfList<cr>
" Show all diagnostics
nnoremap <silent> <space>aa  :CocFzfList actions<cr>
" Manage extensions
nnoremap <silent> <space>ae  :CocFzfList extensions<cr>
" Manage services
nnoremap <silent> <space>aw  :CocFzfList services<cr>
" Show commands
nnoremap <silent> <space>ac  :CocFzfList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>ao  :CocFzfList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>as  :CocFzfList symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>aj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ak  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>ap  :<C-u>CocListResume<cr>
" Open coc log
nnoremap <space>al :CocOpenLog<cr>
" Open coc log
nnoremap <space>ai :CocInfo<cr>
" Open coc config
nnoremap <space>ag :tabnew \| CocConfig<cr>
" Restart coc
nnoremap <space>ar :CocRestart<cr>

" Coc search
nnoremap <space>sc :CocSearch <c-r><c-w><cr>
nnoremap <space>cs :CocSearch 
xnoremap <space>sc y:CocSearch <c-r>0<cr>

" Delay load coc config again, which fix the bug with coc completion does not work at first time start
autocmd VimEnter * call timer_start(200, { tid -> execute('source ~/Projects/dotfiles/.vim/config/coc.vim')})
