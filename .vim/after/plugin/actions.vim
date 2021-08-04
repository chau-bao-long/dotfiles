nnoremap <space><space> :lua require'telescope.builtin'.actions(require('telescope.themes').get_dropdown({ winblend = 10, data = 'commonActions' }))<cr>
nnoremap <space>se :lua require'telescope.builtin'.actions(require('telescope.themes').get_dropdown({ winblend = 10, data = 'databases' }))<cr>
nnoremap <space>k :lua require'telescope.builtin'.actions(require('telescope.themes').get_dropdown({ winblend = 10, data = 'fromFileType' }))<cr>
nnoremap <space>fs :lua require'telescope.builtin'.git_status()<cr>
nnoremap <space>fc :lua require'telescope.builtin'.git_commits()<cr>

let g:kotlinActions = [
      \ ['💾 ktlint', 'tabnew | terminal ktlint'],
      \ ['💾 ktfix', 'Dispatch! ktlint -F'],
      \ ['💾 ktformat', 'tabnew | terminal ./gradlew ktlintFormat'],
      \ ['💾 format kotlin', 'tabnew | terminal ./gradlew formatKotlin'],
      \ ['💾 run all test', 'tabnew | terminal ./gradlew cleanTest test --info'],
      \ ['💾 build', 'tabnew | terminal ./gradlew build'],
      \ ['💾 bootJar', 'tabnew | terminal ./gradlew bootJar'],
      \ ['💾 compile', 'tabnew | terminal ./gradlew compileKotlin'],
      \ ['💾 clean', 'tabnew | terminal ./gradlew clean'],
      \ ['💾 gradle local', 'call javafunctions#goToNearestGradleFolder() | !~/Projects/personio/bin/setup-env.sh'],
      \ ['💾 run', 'call common#goBackToRoot() | tabnew | terminal ./run.sh', ['Rerun microservices']],
      \]

let g:javascriptActions = [
      \ ['💾 eslint all file', 'Dispatch pwd | xargs eslint'],
      \ ['💾 eslint current file', 'Dispatch! eslint %:p'],
      \ ['💾 eslint fix all file', 'Dispatch pwd | xargs eslint --fix'],
      \ ['💾 eslint fix current file', 'Dispatch eslint --fix %:p'],
      \ ['💾 prettier all file', 'Dispatch yarn prettier'],
      \ ['💾 prettier current file', 'Dispatch! prettier --write %:p'],
      \ ['💾 flow current file', 'Dispatch ./node_modules/.bin/flow %'],
      \]

let g:phpActions = [
      \[ 'unpatch personio', 'Dispatch! git apply -R ../patches/*'],
      \[ 'patch personio', 'Dispatch! git apply ../patches/*'],
      \[ 'php cs fixer', 'Dispatch! php-cs-fixer fix %:p', ['Fix lint using php cs fixer']],
      \[ 'perctl lint fix', 'Dispatch! ./perctl lint-fix', ['Fix lint using perctl command']],
      \]

let g:commonActions = [
      \[
      \ '🔎 change personio',
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
      \ '🔎 change projects',
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
      \ '🔎 root personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#changeProjectHandler"), 1)',
      \ [
      \   ' - Change root to one of project in Personio',
      \ ]
      \],
      \[
      \ '🔎 root projects',
      \ 'call common#selectProject("~/Projects", function("common#changeProjectHandler"), 1)',
      \ [
      \   ' - Change root to one of project in ~/Projects folder',
      \ ]
      \],
      \[
      \ '🔎 files vim plugins',
      \ 'call common#selectProject("~/.vim/plugged", function("common#openFileInProjectHandler"), 1)',
      \ [
      \   ' - Change root to one of vim plugin',
      \ ]
      \],
      \[
      \ '🔎 files personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#openFileInProjectHandler"), 0)',
      \ [
      \   ' - Pick a file in one of project in Personio',
      \ ]
      \],
      \[
      \ '🔎 files projects',
      \ 'call common#selectProject("~/Projects", function("common#openFileInProjectHandler"), 0)',
      \ [
      \   ' - Pick a file in one of project in ~/Projects folder',
      \ ]
      \],
      \[
      \ '🔎 files vim config',
      \ "Files ~/Projects/dotfiles/.vim/after/plugin/",
      \ [
      \   ' - Pick a vim config file',
      \ ]
      \],
      \[
      \ '🔎 files vim function',
      \ "Files ~/Projects/dotfiles/.vim/autoload/",
      \ [
      \   ' - Pick a file in ~/Projects/dotfiles/.vim/autoload/ folder',
      \ ]
      \],
      \[
      \ '🔎 files lua modules',
      \ "Files ~/Projects/dotfiles/.vim/lua",
      \ [
      \   ' - Pick a lua module',
      \ ]
      \],
      \[
      \ '🔎 files vim filetype config',
      \ "Files ~/.vim/ftplugin/",
      \ [
      \   ' - Pick a file in ~/.vim/ftplugin/ folder',
      \ ]
      \],
      \[
      \ '🔎 files user bin',
      \ "Files ~/bin",
      \ [
      \   ' - Pick a file in ~/bin folder',
      \ ]
      \],
      \[
      \ '🔎 grep personio',
      \ 'call common#selectProject("~/Projects/personio", function("common#grepInProjectHandler"), 0)',
      \ [
      \   ' - Search in one of project in Personio',
      \ ]
      \],
      \[
      \ '🔎 grep projects',
      \ 'call common#selectProject("~/Projects", function("common#grepInProjectHandler"), 0)',
      \ [
      \   ' - Search in one of project in ~/Projects folder',
      \ ]
      \],
      \[
      \ '🔎 zsh config',
      \ 'tabnew ~/.zshrc',
      \],
      \[
      \ '🔎 tmux config',
      \ 'tabnew ~/.tmux.conf',
      \],
      \[
      \ '🔎 user config',
      \ "Files ~/.config",
      \ [
      \   ' - Pick a file in ~/.config folder',
      \ ]
      \],
      \[ '📌 ctags ruby with lib', 'Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)'],
      \[ '📌 ctags ruby', 'Dispatch! ctags -R --languages=Ruby --exclude=.git --exclude=log .'],
      \[ '📌 ctags js with lib', 'Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=dist --exclude=log .'],
      \[ '📌 ctags js', 'Dispatch! ctags -R --languages=JavaScript --exclude=.git --exclude=log --exclude=node_modules --exclude=dist .'],
      \[ '📌 ctags python with lib', 'Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log . $(pip show pip | grep Location | cut -d ":" -f 2)'],
      \[ '📌 ctags python', 'Dispatch! ctags -R --languages=Python --exclude=.git --exclude=log .'],
      \[ '📌 ctags php', 'Dispatch! ctags -R --languages=PHP --exclude=.git --exclude=log .'],
      \[ '📌 ctags java with lib', 'Dispatch! ctags -R --languages=java,kotlin --exclude=.git --exclude=log --exclude=.gradle --exclude=.gradle-home --exclude=data . ~/Projects/lib/java'],
      \[ '📌 ctags java', 'Dispatch! ctags -R --languages=java,kotlin --exclude=.git --exclude=log --exclude=.gradle --exclude=.gradle-home --exclude=data .'],
      \[ '📌 ctags c', 'Dispatch! ctags -R --languages=c,c++ --exclude=.git .'],
      \]
