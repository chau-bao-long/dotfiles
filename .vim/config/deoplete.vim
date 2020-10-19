call deoplete#custom#option({
      \ 'min_pattern_length': 1,
      \ 'refresh_always': v:true,
      \ 'auto_refresh_delay': 200,
      \ 'auto_complete_delay': 300,
      \ 'camel_case': v:false,
      \ 'smart_case': v:false,
      \ 'skip_multibyte': v:false,
      \ 'auto_preview': v:false
      \ })

call deoplete#custom#source('Comrade', 'rank', 1000)
call deoplete#custom#source('buffer', 'rank', 999)
call deoplete#custom#source('tabnine', 'rank', 998)
call deoplete#custom#source('tag', 'rank', 997)
call deoplete#custom#source('dictionary', 'rank', 996)
