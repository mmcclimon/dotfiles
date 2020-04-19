" Settings for javascript files

if g:colors_name ==? "gruvbox"
    hi link typescriptClassFuncName GruvboxAqua
    hi link typescriptStorageClass Statement
    hi link typescriptThis GruvboxBlue
    hi link typescriptOperatorKeyword GruvboxBlue
    hi link typescriptGlobalObjects GruvboxOrange
    hi link typescriptTemplateBraces GruvboxAqua
    hi link typescriptClassKeyword jsFunction

    hi link typescriptFuncCall GruvboxFg2

    " really, these are two separate things??
    hi link typescriptException GruvboxRed
    hi link typescriptExceptions jsException

endif
