vim9script

g:go_highlight_trailing_whitespace_error = 0
b:ale_fix_on_save = 1

# hard tabs, sigh
setlocal listchars+=tab:\ \  noexpandtab
setlocal tabstop=2 shiftwidth=2

# Let's try out gopls, and pretend they're tags
nnoremap <buffer> <C-]> <Plug>(ale_go_to_definition)
