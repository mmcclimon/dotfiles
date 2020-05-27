" rust colors are, out of the box, a little too rainbow for me
if g:colors_name ==? "gruvbox"
    hi link rustModPath Normal
    hi link rustModPathSep Normal

    hi link rustFuncCall GruvboxBlue
    hi link rustKeyword GruvboxPurple
    hi link rustSelf GruvboxFg2
    hi link rustSigil GruvboxFg3
    hi link rustQuestionMark rustSigil
    hi link rustStorage rustSigil
    hi link rustLifetime rustSigil
    hi rustType guifg=#cc9b27

    " tone down the aqua for attributes
    hi rustAttribute guifg=#688868
    hi rustDerive guifg=#688868
    hi rustDeriveTrait guifg=#a38241

    " hi perlPOD guifg=#686868
    " hi podCommand guifg=#586878
    " hi podCmdText guifg=#587858
    " hi podFormat guifg=#785868
    " hi podVerbatimLine guifg=#787358
endif


