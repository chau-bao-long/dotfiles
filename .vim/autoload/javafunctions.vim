function! javafunctions#goToNearestGradleFolder()
  execute "silent! Rooter"
  let gradleRoot = system("rg --files | rg gradlew$ | sed 's\/gradlew.*\/\/g'")
  if len(trim(gradleRoot)) > 0
    execute 'chdir! ' . gradleRoot
  endif
endfunction
