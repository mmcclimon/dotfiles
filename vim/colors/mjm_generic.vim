set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="mjm_generic"

hi Normal guifg=#d4d4d4 guibg=#303030
hi Comment guifg=#737373 guibg=NONE gui=italic
hi Constant guifg=#9660de guibg=NONE
hi String guifg=#718FA1 guibg=NONE
hi htmlTagName guifg=#d4b294 guibg=NONE
hi Identifier guifg=#c78bc0 guibg=NONE
hi Statement guifg=#cf5f5f guibg=NONE
hi PreProc guifg=#c23ec2 guibg=NONE
hi Type guifg=#77ba77 guibg=NONE gui=NONE
hi Function guifg=#fad900 guibg=NONE
hi Repeat guifg=#cf5f5f guibg=NONE
"hi Operator guifg=#964444 guibg=NONE
hi link Operator Normal
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff

hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	htmlTagName
hi link htmlEndTag htmlTag
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

" Markdown
hi link htmlH1 Type
hi link mkdListItem String


" PHP
hi link phpIdentifier Identifier
hi link phpVarSelector phpIdentifier
hi phpMemberHere guifg=#a97da4 guibg=NONE
hi phpSuperglobal guifg=#D2A2CD guibg=NONE

" Vim interface
hi Directory guifg=#77ba77
hi ColorColumn guibg=#3d3d3d
hi link CursorColumn ColorColumn
hi LineNr guifg=#5c5c5c
hi NonText guifg=#464646 gui=none
hi Search guibg=#4ab240
hi IncSearch guibg=#6aff5c
hi Visual guifg=#7a7a7a
hi ExtraWhitespace guibg=#b30000
hi Folded guibg=#3d3d54 guifg=#848484 gui=bold
