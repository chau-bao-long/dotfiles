nnoremap <space><space> :lua require'telescope.builtin'.actions(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>

let g:actionsInLua = [
      \[
      \ 'change personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#changeProjectHandler"), 0)',
      \ [
      \   '🔎 More details',
      \   '',
      \   ' - Clear all buffers',
      \   ' - Pick a project within Personio',
      \   ' - Pick a file in selected project',
      \ ]
      \],
      \[
      \ 'change projects',
      \ 'call common#selectProject("~/Projects", function("common#changeProjectHandler"), 0)',
      \ [
      \   '🔎 More details',
      \   '',
      \   ' - Clear all buffers',
      \   ' - Pick a project in ~/Projects folder',
      \   ' - Pick a file in selected project',
      \ ]
      \],
      \[
      \ 'root personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#changeProjectHandler"), 1)',
      \ [
      \   ' - Change root to one of project in Personio',
      \ ]
      \],
      \[
      \ 'root projects',
      \ 'call common#selectProject("~/Projects", function("common#changeProjectHandler"), 1)',
      \ [
      \   ' - Change root to one of project in ~/Projects folder',
      \ ]
      \],
      \[
      \ 'files vim plugins',
      \ 'call common#selectProject("~/.vim/plugged", function("common#openFileInProjectHandler"), 1)',
      \ [
      \   ' - Change root to one of vim plugin',
      \ ]
      \],
      \[
      \ 'files personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#openFileInProjectHandler"), 0)',
      \ [
      \   ' - Pick a file in one of project in Personio',
      \ ]
      \],
      \[
      \ 'files projects',
      \ 'call common#selectProject("~/Projects", function("common#openFileInProjectHandler"), 0)',
      \ [
      \   ' - Pick a file in one of project in ~/Projects folder',
      \ ]
      \],
      \[
      \ 'files vim config',
      \ "Files ~/Projects/dotfiles/.vim/config/",
      \ [
      \   ' - Pick a file in ~/Projects/dotfiles/.vim/config/ folder',
      \ ]
      \],
      \[
      \ 'files vim function',
      \ "Files ~/Projects/dotfiles/.vim/autoload/",
      \ [
      \   ' - Pick a file in ~/Projects/dotfiles/.vim/autoload/ folder',
      \ ]
      \],
      \[
      \ 'files lua function',
      \ "Files ~/Projects/dotfiles/.vim/lua/",
      \ [
      \   ' - Pick a file in ~/Projects/dotfiles/.vim/lua/ folder',
      \ ]
      \],
      \[
      \ 'files vim filetype config',
      \ "Files ~/.vim/ftplugin/",
      \ [
      \   ' - Pick a file in ~/.vim/ftplugin/ folder',
      \ ]
      \],
      \[
      \ 'files user bin',
      \ "Files ~/bin",
      \ [
      \   ' - Pick a file in ~/bin folder',
      \ ]
      \],
      \[
      \ 'grep personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#grepInProjectHandler"), 0)',
      \ [
      \   ' - Search in one of project in Personio',
      \ ]
      \],
      \[
      \ 'grep projects',
      \ 'call common#selectProject("~/Projects", function("common#grepInProjectHandler"), 0)',
      \ [
      \   ' - Search in one of project in ~/Projects folder',
      \ ]
      \],
      \[
      \ 'zsh config',
      \ 'tabnew ~/.zshrc',
      \],
      \[
      \ 'tmux config',
      \ 'tabnew ~/.tmux.conf',
      \],
      \[
      \ 'user config',
      \ "Files ~/.config",
      \ [
      \   ' - Pick a file in ~/.config folder',
      \ ]
      \],
      \]
