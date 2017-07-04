let g:ledger_align_at = 50

function! AlignXact()
    let l:save_cursor = getpos(".")
    let l:xact_info = ledger#transaction_from_lnum(line("."))
    let l:start = xact_info['head']
    let l:end = xact_info['tail']
    exe l:start . ',' . l:end 'call ledger#align_commodity()'
    call setpos('.', l:save_cursor)
endfunction

nnoremap <silent> <buffer> <Leader>c :call ledger#transaction_state_toggle(line("."), " *")<CR>
nnoremap <silent> <buffer> <Leader>q :call AlignXact()<CR>
