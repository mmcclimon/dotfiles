augroup ft_jenkins
    au!
    au BufRead,BufNewFile Jenkinsfile setl filetype=groovy
augroup END

augroup ft_vagrant
    au!
    au BufRead,BufNewFile Vagrantfile setl filetype=ruby
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

