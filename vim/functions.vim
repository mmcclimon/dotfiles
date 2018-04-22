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


" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif


" }}}
