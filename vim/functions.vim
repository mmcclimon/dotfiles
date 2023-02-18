" Miscellaneous vim functions
" (plus bindings for them)
vim9script

# Function to clean up trailing whitespace.
# Stolen from http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
def StripTrailingWhitespace()
    # Preparation: save last search, and cursor position.
    var _s = @/
    var l = line(".")
    var c = col(".")
    # Do the business:
    :%s/\s\+$//e
    # Clean up: restore previous search history, and cursor position
    @/ = _s
    cursor(l, c)
enddef

nnoremap <silent> <Leader>w <ScriptCmd>StripTrailingWhitespace()<CR>

def CreateOrSwitchToScratchBuffer()
    if buflisted("_scratch") == 0
        badd _scratch
        buffer _scratch
        set buftype=nofile
        set filetype=markdown
        append(0, '<!-- This is a scratch buffer, set up with ft=markdown -->')
        append(1, '<!-- You cannot save this file unless you write it somewhere else first -->')
    else
        buffer _scratch
    endif
enddef

nnoremap <C-x><C-b> :call CreateOrSwitchToScratchBuffer()<CR>

# Save current view settings on a per-window, per-buffer basis.
def AutoSaveWinView()
    if !exists("w:SavedBufView")
        w:SavedBufView = {}
    endif
    w:SavedBufView[bufnr("%")] = winsaveview()
enddef

# Restore current view settings.
def AutoRestoreWinView()
    var buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        var v = winsaveview()
        var atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
enddef

def Colemak()
    # modal swapping
    noremap u i
    noremap U I

    # hjkl = hnei
    noremap h h
    noremap n j
    noremap e k
    noremap i l
    noremap H H
    noremap N J
    noremap E K
    noremap I L

    # stuff stolen by the above
    noremap k n
    noremap K N
    noremap l u
    noremap L U
    noremap j e
    noremap J E
    nnoremap <Space> :

    # vim-repeat blats the u mapping, so make sure it's loaded, then do that
    # mapping here.
    nmap l <Plug>(RepeatUndo)

    nnoremap <C-t> <C-f>
    nnoremap <C-f> <C-e>
enddef

Colemak()

# When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * AutoSaveWinView()
    autocmd BufEnter * AutoRestoreWinView()
endif

# }}}
