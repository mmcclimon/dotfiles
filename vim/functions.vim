" Miscellaneous vim functions
" (plus bindings for them)

" A function to exec current line of vimscript.
" This is bound to <C-x><C-e>, as a copy of Emacs 'eval-last-sexp'.
function! ExecCurrentLine()
    let l:curline = getline('.')
    echo ":" . l:curline
    execute l:curline
    sleep 1
    redraw
endfunction

nnoremap <C-x><C-e> :call ExecCurrentLine()<CR>

" Function to clean up trailing whitspace.
function! FixWhitespace()
    let l:save_cursor = getpos(".")
    silent! execute ':%s/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Function to clean up trailing whitespace.
" Stolen from http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <Leader>w :call <SID>StripTrailingWhitespace()<CR>


function! CreateOrSwitchToScratchBuffer()
    if buflisted("_scratch") == 0
        badd _scratch
        buffer _scratch
        set buftype=nofile
        set filetype=markdown
        call append(0, '<!-- This is a scratch buffer, set up with ft=markdown -->')
        call append(1, '<!-- You cannot save this file unless you write it somewhere else first -->')
    else
        buffer _scratch
    endif
endfunction

nnoremap <C-x><C-b> :call CreateOrSwitchToScratchBuffer()<CR>
" }}}
