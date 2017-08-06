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
    hi Search term=reverse ctermbg=51 ctermfg=240 guifg=#444444 guibg=#00f0f0
endif

