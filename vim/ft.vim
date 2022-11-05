augroup ft_jenkins
    au!
    au BufRead,BufNewFile Jenkinsfile setl filetype=groovy
augroup END

augroup ft_ledger
    au!
    au FileType ledger let @m = 'yypR(mjm)     ,c}jj'
    au FileType ledger let @y = 'yypR(ynab)    ,c}jj'
augroup END

augroup ft_typescript
    au!
    au Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au Filetype typescript let b:ale_fix_on_save = 1
augroup END

augroup ft_json
    au!
    au Filetype json let b:ale_fix_on_save = 1
augroup END

augroup ft_go
    au!
    hi link goSpaceError None
    au Filetype go let b:ale_fix_on_save = 1
    au Filetype go setlocal noexpandtab listchars+=tab:\ \  tabstop=2 shiftwidth=2
augroup END

augroup ft_rust
    au!
    au Filetype rust let b:ale_fix_on_save = 1
    au Filetype rust setlocal textwidth=80
    au Filetype rust setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

augroup ft_markdown
    au!
    au Filetype markdown setlocal nosmartindent
augroup END

" these actually get used bottom to top,
let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['brown',       'firebrick3'],
  \ ['darkgreen',   'MediumOrchid2'],
  \ ['Darkblue',    'SteelBlue'],
  \ ['black',       'HotPink'],
  \ ['darkcyan',    'DarkKhaki'],
  \ ['darkred',     'SpringGreen3'],
  \ ['darkmagenta', 'DarkOrange3'],
  \ ['red',         'Grey58'],
\ ]

augroup ft_lisp
    au!
    au Filetype lisp let b:delimitMate_quotes = "\""
    au Filetype lisp cal rainbow_parentheses#activate()
    au Filetype lisp cal rainbow_parentheses#load(0)
augroup END
