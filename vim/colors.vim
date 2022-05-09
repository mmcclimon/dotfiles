set background=dark
let g:gruvbox_italic=1
let g:gruvbox_bold=0
let g:gruvbox_contrast_light = "soft"
colorscheme gruvbox

" always do these
hi Todo ctermbg=88 ctermfg=250 guibg=#582829 guifg=#a08374

if g:colors_name ==? "base16-default-dark"
    hi StatusLine ctermbg=239 ctermfg=253
    hi StatusLineNC ctermbg=236 ctermfg=247
    hi LineNr ctermbg=235
    hi Visual term=reverse ctermbg=99
    hi VertSplit term=reverse ctermbg=238 ctermfg=0
    hi CursorLine term=reverse ctermbg=236
    hi CursorLineNr term=reverse ctermbg=235 ctermfg=112
    hi CursorColumn term=reverse ctermbg=236
    hi Folded ctermbg=235 ctermfg=31
endif

if g:colors_name ==? "gruvbox"
    hi Normal ctermfg=white
    hi Search term=reverse ctermbg=51 ctermfg=240 guifg=#444444 guibg=#00f0f0
    hi Cursor guifg=#ebdbb2
    hi Visual term=reverse cterm=reverse gui=none ctermbg=241 guibg=#3e3e5e

    " temporary? I'm trying a lower contrast thing and wanna play with this
    " for a while. -- michael, 2018-11-14
    hi String guifg=#b8ba54
    hi! link Statement GruvboxPurple
    hi! link Repeat GruvboxPurple
    hi! link Conditional GruvboxPurple
    hi! Identifier guifg=#889c94
endif
