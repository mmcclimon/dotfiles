vim9script

b:ale_fix_on_save = 1

setlocal textwidth=80
setlocal tabstop=2 shiftwidth=2 softtabstop=2

setlocal omnifunc=ale#completion#OmniFunc
nnoremap <buffer> <C-]> <Plug>(ale_go_to_definition)
nnoremap <buffer> <localleader>r <Plug>(ale_find_references)
nnoremap <buffer> <localleader>d <Plug>(ale_hover)
