setlocal omnifunc=ale#completion#OmniFunc
nnoremap <buffer> <C-]> <Plug>(ale_go_to_definition)
nnoremap <buffer> <localleader>r <Plug>(ale_find_references)
nnoremap <buffer> <localleader>d <Plug>(ale_hover)

