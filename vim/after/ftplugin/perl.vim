" vim settings for perl

" au Filetype perl setlocal tabstop=2 shiftwidth=2

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

    hi perlVarPlain guifg=#ab4642
    hi perlMethod guifg=#cb8682
endif
