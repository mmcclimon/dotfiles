" Settings for javascript files

au Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

if g:colors_name ==? "gruvbox"
    hi link jsClassFuncName GruvboxAqua
    hi link jsStorageClass Statement
    hi link jsThis GruvboxBlue
    hi link jsOperatorKeyword GruvboxBlue
    hi link jsGlobalObjects GruvboxOrange
    hi link jsTemplateBraces GruvboxAqua
    hi link jsClassKeyword jsFunction

    hi link jsFuncCall GruvboxFg2

    " really, these are two separate things??
    hi link jsException GruvboxRed
    hi link jsExceptions jsException

endif
