vim9script

g:ale_lint_on_text_changed = 'never'
g:ale_lint_on_enter = 'never'
g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
# g:ale_rust_rustfmt_options = '+nightly'
g:ale_rust_cargo_check_tests = 1
g:ale_rust_cargo_check_all_targets = 1
g:ale_linters_explicit = 0
g:ale_completion_enabled = 0
g:ale_sign_error = '>>'
g:ale_sign_warning = '--'
g:ale_virtualtext_cursor = 'current'

g:ale_linters = {
  perl: ['perl'],
  javascript: ['eslint', 'prettier'],
  typescript: ['eslint', 'prettier', 'tsserver'],
  rust: ['cargo', 'analyzer'],
  go: ['gopls', 'golangci-lint'],
  python: ['ruff', 'ty'],
}

g:ale_fixers = {
  javascript: ['prettier', 'eslint'],
  typescript: ['prettier'],
  json: ['prettier'],
  rust: ['rustfmt'],
  go: ['goimports'],
  python: ['ruff_format'],
}

nnoremap <Leader>q <silent> :ALEFix<Enter>
nmap <Leader>e <Plug>(ale_detail)

nmap <silent> [s <Plug>(ale_previous_wrap)
nmap <silent> ]s <Plug>(ale_next_wrap)
nmap <silent> [S <Plug>(ale_first)
nmap <silent> ]S <Plug>(ale_last)
