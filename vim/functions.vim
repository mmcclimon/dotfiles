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
