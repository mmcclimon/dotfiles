" Converted from Textmate theme Michael dark using Coloration v0.3.2
" (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
	  syntax reset
endif

let g:colors_name = "mjm_dark"

" interface
hi Cursor guifg=#2e3230 guibg=#FF8A3D

hi Visual ctermfg=NONE ctermbg=107 cterm=NONE guifg=NONE guibg=#77b855 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#404442 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#404442 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#404442 gui=NONE
hi LineNr ctermfg=245 ctermbg=238 cterm=NONE guifg=#898b8a guibg=#404442 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#626564 guibg=#626564 gui=NONE
hi MatchParen ctermfg=167 ctermbg=NONE cterm=underline guifg=#ce5d56 guibg=NONE gui=underline
hi StatusLine ctermfg=254 ctermbg=241 cterm=bold guifg=#e3e3e3 guibg=#626564 gui=bold
hi StatusLineNC ctermfg=254 ctermbg=241 cterm=NONE guifg=#e3e3e3 guibg=#626564 gui=NONE
hi Pmenu ctermfg=185 ctermbg=NONE cterm=NONE guifg=#ebd234 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=107 cterm=NONE guifg=NONE guibg=#77b855 gui=NONE
hi IncSearch ctermfg=236 ctermbg=67 cterm=NONE guifg=#2e3230 guibg=#6996b2 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718e54 guibg=NONE gui=NONE
hi Folded ctermfg=244 ctermbg=236 cterm=NONE guifg=#7f8083 guibg=#2e3230 gui=NONE

" standard colors
hi Normal guibg=#2a2a2a guifg=#c3c3c3
hi String guifg=#5E87A0
hi Identifier guifg=#FEA6E2
"hi Normal ctermfg=254 ctermbg=236 cterm=NONE guifg=#e3e3e3 guibg=#2e3230 gui=NONE
hi Boolean ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718e54 guibg=NONE gui=NONE
hi Character ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718e54 guibg=NONE gui=NONE
hi Comment ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f8083 guibg=NONE gui=NONE
hi Conditional ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ce5d56 guibg=NONE gui=NONE
hi Constant ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718e54 guibg=NONE gui=NONE
hi Define ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ce5d56 guibg=NONE gui=NONE
hi DiffAdd ctermfg=254 ctermbg=64 cterm=bold guifg=#e3e3e3 guibg=#48850e gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8c0a0a guibg=NONE gui=NONE
hi DiffChange ctermfg=254 ctermbg=23 cterm=NONE guifg=#e3e3e3 guibg=#273e5c gui=NONE
hi DiffText ctermfg=254 ctermbg=24 cterm=bold guifg=#e3e3e3 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=88 cterm=NONE guifg=#f8f8f8 guibg=#800f00 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=88 cterm=NONE guifg=#f8f8f8 guibg=#800f00 gui=NONE
hi Float ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Function ctermfg=185 ctermbg=NONE cterm=NONE guifg=#ebd234 guibg=NONE gui=NONE
"hi Identifier ctermfg=176 ctermbg=NONE cterm=NONE guifg=#d997cf guibg=NONE gui=NONE
hi Keyword ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ce5d56 guibg=NONE gui=NONE
hi Label ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6996b2 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=237 cterm=NONE guifg=#646769 guibg=#373b39 gui=NONE
hi Number ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Operator ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ce5d56 guibg=NONE gui=NONE
hi PreProc ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ce5d56 guibg=NONE gui=NONE
hi Special ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e3e3e3 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=238 cterm=NONE guifg=#646769 guibg=#404442 gui=NONE
hi Statement ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ce5d56 guibg=NONE gui=NONE
hi StorageClass ctermfg=176 ctermbg=NONE cterm=NONE guifg=#d997cf guibg=NONE gui=NONE
"hi String ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6996b2 guibg=NONE gui=NONE
hi Tag ctermfg=185 ctermbg=NONE cterm=NONE guifg=#ebd234 guibg=NONE gui=NONE
hi Title ctermfg=254 ctermbg=NONE cterm=bold guifg=#e3e3e3 guibg=NONE gui=bold
hi Todo ctermfg=244 ctermbg=NONE cterm=inverse,bold guifg=#7f8083 guibg=NONE gui=inverse,bold
hi Type ctermfg=185 ctermbg=NONE cterm=NONE guifg=#ebd234 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline


" html
hi htmlTag ctermfg=144 ctermbg=NONE cterm=NONE guifg=#bcad85 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=144 ctermbg=NONE cterm=NONE guifg=#bcad85 guibg=NONE gui=NONE
hi htmlTagName ctermfg=144 ctermbg=NONE cterm=NONE guifg=#bcad85 guibg=NONE gui=NONE
hi htmlArg ctermfg=144 ctermbg=NONE cterm=NONE guifg=#bcad85 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=245 ctermbg=NONE cterm=NONE guifg=#8d8e8d guibg=NONE gui=italic

" js
hi javaScriptFunction ctermfg=176 ctermbg=NONE cterm=NONE guifg=#d997cf guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=178 ctermbg=NONE cterm=NONE guifg=#d8b100 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" css
hi cssURL ctermfg=181 ctermbg=NONE cterm=NONE guifg=#eab8ba guibg=NONE gui=NONE
hi cssFunctionName ctermfg=178 ctermbg=NONE cterm=NONE guifg=#d8b100 guibg=NONE gui=NONE
hi cssColor ctermfg=65 ctermbg=NONE cterm=NONE guifg=#718e54 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=107 ctermbg=NONE cterm=NONE guifg=#76a268 guibg=NONE gui=NONE
hi cssClassName ctermfg=107 ctermbg=NONE cterm=NONE guifg=#76a268 guibg=NONE gui=NONE
hi cssValueLength ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=174 ctermbg=NONE cterm=NONE guifg=#eb939a guibg=NONE gui=NONE
hi cssBraces ctermfg=246 ctermbg=NONE cterm=NONE guifg=#969897 guibg=NONE gui=NONE
