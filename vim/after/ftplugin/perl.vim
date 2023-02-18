" vim settings for perl

" patch color scheme for better perl colors
if g:colors_name ==? "base16-default-dark"
    hi perlPOD guifg=#686868
    hi podCommand guifg=#586878
    hi podCmdText guifg=#587858
    hi podFormat guifg=#785868
    hi podVerbatimLine guifg=#787358

    hi link perlStatementStorage Conditional
    hi link perlStatementFiles Conditional
    hi link perlStatementControl Conditional
    hi link perlStatementFiledesc Conditional

    hi link perlNumber Normal
    hi link perlFloat Normal

    hi perlVarPlain ctermfg=1 guifg=#ab4642
    hi perlMethod ctermfg=167 guifg=#cb8682
endif

if g:colors_name ==? "gruvbox"
    hi link perlPOD Comment
    hi podCommand guifg=#586878 term=bold ctermfg=245
    hi podCmdText guifg=#587858 term=bold ctermfg=245
    hi podFormat guifg=#785868 term=bold ctermfg=245
    hi podVerbatimLine guifg=#787358 term=bold ctermfg=245

    hi String guifg=#b8ba54
    hi link Statement GruvboxPurple
    hi link Repeat GruvboxPurple
    hi Identifier guifg=#889c94

    hi link perlSpecial GruvboxAqua
    " hi link perlMatch GruvboxAqua
endif
