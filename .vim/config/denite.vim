let s:denite_options = {
            \ 'prompt' : '🔑',
            \ 'split': 'floating',
            \ 'start_filter': 1,
            \ 'auto_resize': 1,
            \ 'source_names': 'short',
            \ 'direction': 'botright',
            \ 'highlight_filter_background': 'CursorLine',
            \ 'highlight_matched_char': 'Type',
            \ 'filter-split-direction': 'floating',
            \ }

call denite#custom#option('default', s:denite_options)

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> <c-t>
                \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> <c-v>
                \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <c-x>
                \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> V
                \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer><expr> <c-t>
                \ denite#do_map('do_action', 'tabopen')
    inoremap <silent><buffer><expr> <c-v>
                \ denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <c-x>
                \ denite#do_map('do_action', 'split')
    inoremap <silent><buffer><expr> <esc>
                \ denite#do_map('quit')
    inoremap <silent><buffer><expr> <c-h>
                \ denite#do_map('restore_sources')
    inoremap <silent><buffer> <C-j>
                \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-k>
                \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

" Change matchers.
call denite#custom#source(
            \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
            \ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
            \ 'file/rec', 'sorters', ['sorter/sublime'])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Add custom menus
let s:menus = {}
let s:menus.dotfiles = {
            \ 'description': '🔆 Config any dot files'
            \ }
let s:menus.dotfiles.file_candidates = [
            \ ['🔆 zsh', '~/.zshrc'],
            \ ['🔆 vim', '~/.vimrc'],
            \ ['🔆 tmux', '~/.tmux.conf.local'],
            \ ['🔆 gitconfig', '~/.gitconfig'],
            \ ['🔆 coc-setting', '~/.config/nvim/coc-settings.json'],
            \ ]
let s:menus.dotfiles.command_candidates = [
            \ ['🔆 dotfiles project', 'tabnew ~/Projects/dotfiles'],
            \ ]
let s:menus.binfiles = {
            \ 'description': '📄 Access bin files'
            \ }
let s:menus.binfiles.file_candidates = [
            \ ['📄 currentcmd', '~/bin/current-cmd'],
            \ ['📄 personio', '~/bin/personio.api'],
            \ ['📄 adminpanel', '~/bin/admin-panel.api'],
            \ ]
let s:menus.directories = {
            \ 'description': '📂 Frequently used directories'
            \ }
let s:menus.directories.directory_candidates = [
            \ ['📂 vim config', '~/Projects/dotfiles/.vim/config/'],
            \ ['📂 vim filetype', '~/.vim/ftplugin/'],
            \ ]
let s:menus.directories.command_candidates = [
            \ ['📂 vim plugin', 'tabnew ~/.vim/plugged/'],
            \ ['📂 user config', 'tabnew ~/.config/'],
            \ ]
let s:menus.commands = {
            \ 'description': '💾 Frequently used commands'
            \ }
let s:menus.commands.command_candidates = [
            \ ['💾 Edit snippet', 'UltiSnipsEdit'],
            \ ['💾 Open zsh menu', 'Denite menu:dotfiles'],
            \ ]
let s:menus.kotlin = {
            \ 'description': '💾 Kolin project commands'
            \ }
let s:menus.kotlin.command_candidates = [
            \ ['💾 ktlint', 'Dispatch ktlint'],
            \ ['💾 ktfix', 'Dispatch! ktlint -F'],
            \ ['💾 run all test', 'Dispatch cd app && ./gradlew.local cleanTest test --info'],
            \ ['💾 patch admin panel', 'Dispatch! git apply ../patches-admin-panel/*'],
            \ ['💾 unpatch admin panel', 'Dispatch! git apply -R ../patches-admin-panel/*'],
            \ ]
let s:menus.js = {
            \ 'description': '💾 Javascript project commands'
            \ }
let s:menus.js.command_candidates = [
            \ ['💾 flow current file', 'Dispatch ./node_modules/.bin/flow %;read'],
            \ ['💾 eslint current file', 'Dispatch eslint %:p:h'],
            \ ['💾 eslint all file', 'Dispatch pwd | xargs eslint'],
            \ ]
let s:menus.php = {
            \ 'description': '💾 PHP project commands'
            \ }
let s:menus.php.command_candidates = [
            \[ 'unpatch personio', 'Dispatch! git apply -R ../patches/*'],
            \[ 'patch personio', 'Dispatch! git apply ../patches/*'],
            \]
let s:menus.ctags = {
            \ 'description': '📌 Ctags on each languages'
            \ }
let s:menus.ctags.command_candidates = [
            \[ '📌 ruby with lib', 'Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)'],
            \[ '📌 ruby', 'Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log .'],
            \[ '📌 js with lib', 'Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=dist --exclude=log .'],
            \[ '📌 js', 'Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=log --exclude=node_modules --exclude=dist .'],
            \[ '📌 python with lib', 'Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log . $(pip show pip | grep Location | cut -d ":" -f 2)'],
            \[ '📌 python', 'Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log .'],
            \[ '📌 php', 'Dispatch! ctags -R --languages=PHP --exclude=.git --exclude=log .'],
            \[ '📌 kotlin', 'Dispatch! ctags -R --languages=kotlin --exclude=.git --exclude=log --exclude=.gradle --exclude=.gradle-home --exclude=data .'],
            \]

call denite#custom#var('menu', 'menus', s:menus)

nmap <space>mm :Denite menu<cr>
nmap <space>mj :Denite menu:js<cr>
nmap <space>mk :Denite menu:kotlin<cr>
nmap <space>mp :Denite menu:php<cr>
nmap <space>mc :Denite menu:ctags<cr>
nmap <space>md :Denite menu:directories<cr>
nmap <space>mb :Denite menu:binfiles<cr>
