vim9script

g:go_highlight_trailing_whitespace_error = 0
b:ale_fix_on_save = 1

# hard tabs, sigh
setlocal listchars+=tab:\ \  noexpandtab
setlocal tabstop=2 shiftwidth=2

# ale
g:ale_go_golangci_lint_options = ''
g:ale_go_golangci_lint_package = 1
g:ale_go_gopls_init_options = {
  analyses: {
    composites: false,
    simplifycompositelit: false,
  },
  standaloneTags: [ "ignore", "mage" ],
}

setlocal omnifunc=ale#completion#OmniFunc
nnoremap <buffer> <C-]> <Plug>(ale_go_to_definition)
nnoremap <buffer> <localleader>r <Plug>(ale_find_references)
nnoremap <buffer> <localleader>d <Plug>(ale_hover)
