" settings for tex files
"
function! SetupTexColors()
    hi texStatement guifg=#a0a0a0
    hi Delimiter    guifg=#a0a0a0
    hi texRefZone   guifg=#507050
    hi texSection   guifg=#996666
    hi texTypeStyle guifg=#a0a0f0
    " hi texDelimiter guifg=#a0a0a0
endfunction

let g:tex_flavor = "latex"

" A function to complete keys from a BibTeX file. Shells out to 'bibkeys'
" (see github.com/mmcclimon/bibkeys) to get a list
function! CompleteBibKeys(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline(".")
        let start = col(".") - 1
        echom line[start - 1]
        while start > 0 && line[start - 1] =~ "[A-Za-z:]"
            let start -=1
        endwhile
        return start
    else
        " find months matching a:base
        let keys = systemlist('bibkeys -1')
        let res = []

        " bibkeys didn't return anything useful, so no completions
        if v:shell_error
            return []
        endif

        for key in keys
            if key =~ '^' . a:base
                call add(res, key)
            endif
        endfor

        return res
    endif
endfunction

" autocommands
au Filetype tex,bib setlocal tabstop=2 shiftwidth=2 textwidth=78
au Filetype tex call SetupTexColors()
au Filetype tex setlocal formatoptions+=t
au Filetype bib setlocal foldmethod=syntax
au Filetype tex :nnoremap <buffer> <C-g> mzgqap`z
" better quotes
" turn off auto pairs for quoting
" au Filetype tex :inoremap <buffer> ` ‘
" au Filetype tex :inoremap <buffer> ' ’
" au Filetype tex :inoremap <buffer> `` “
" au Filetype tex :inoremap <buffer> '' ”
au Filetype tex set omnifunc=CompleteBibKeys
