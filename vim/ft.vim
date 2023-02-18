vim9script

augroup ft_jenkins
    au!
    au BufRead,BufNewFile Jenkinsfile setl filetype=groovy
augroup END

augroup ft_ledger
    au!
    au FileType ledger @m = 'yypR(mjm)     ,c}jj'
    au FileType ledger @y = 'yypR(ynab)    ,c}jj'
augroup END

augroup ft_javascript
    au!
    au Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

augroup ft_typescript
    au!
    au Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au Filetype typescript b:ale_fix_on_save = 1
augroup END

augroup ft_json
    au!
    au Filetype json b:ale_fix_on_save = 1
augroup END

g:go_highlight_trailing_whitespace_error = 0
augroup ft_go
    au!
    au Filetype go b:ale_fix_on_save = 1
    au Filetype go setlocal noexpandtab listchars+=tab:\ \  tabstop=2 shiftwidth=2
    au Filetype go nnoremap <buffer> <C-]> <Plug>(ale_go_to_definition)
augroup END

augroup ft_rust
    au!
    au Filetype rust b:ale_fix_on_save = 1
    au Filetype rust setlocal textwidth=80
    au Filetype rust setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

augroup ft_markdown
    au!
    au Filetype markdown setlocal nosmartindent textwidth=78
augroup END

augroup ft_make
    au!
    au Filetype make setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

augroup ft_mail
    au!
    au FileType mail setlocal textwidth=72
augroup END

augroup ft_perl
    au!
    au FileType perl setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup ft_ruby
    au!
    au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


# these actually get used bottom to top,
g:rbpt_colorpairs = [
  ['brown',       'RoyalBlue3'],
  ['Darkblue',    'SeaGreen3'],
  ['darkgray',    'DarkOrchid3'],
  ['darkgreen',   'firebrick3'],
  ['darkcyan',    'RoyalBlue3'],
  ['darkmagenta', 'DarkOrchid3'],
  ['darkred',     'SeaGreen3'],
  ['gray',        'RoyalBlue3'],
  ['brown',       'firebrick3'],
  ['darkgreen',   'MediumOrchid2'],
  ['Darkblue',    'SteelBlue'],
  ['black',       'HotPink'],
  ['darkcyan',    'DarkKhaki'],
  ['darkred',     'SpringGreen3'],
  ['darkmagenta', 'DarkOrange3'],
  ['red',         'Grey58'],
]

augroup ft_lisp
    au!
    au Filetype lisp b:delimitMate_quotes = "\""
    au Filetype lisp call rainbow_parentheses#activate()
    au Filetype lisp call rainbow_parentheses#load(0)
augroup END
