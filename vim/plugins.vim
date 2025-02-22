" Misc. vim settings for random plugins
vim9script

# airline
if !exists('g:airline_symbols')
    g:airline_symbols = {}
    g:airline_left_sep = ''
    g:airline_right_sep = ''
    g:airline_symbols.branch = '⎇'
    g:airline_symbols.whitespace = 'Ξ'
    g:airline_symbols.maxlinenr = ''
    g:airline_powerline_fonts = 0
    g:airline_section_z = '%3p%% (%v,%l)'

    set noshowmode
endif

def AirlineInit()
  # this used to work without being in a function, but no longer does.
  call airline#parts#define('linenr', {
              \ 'raw': '%-9((%l,%v)%)',
              \ 'accent': 'bold'})
  g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%% ', 'linenr'])
enddef

au VimEnter * call AirlineInit()

# argwrap
g:argwrap_tail_comma = 1
nnoremap <silent> <leader>a :ArgWrap<CR>

# netrw -------------------------------------------------------{{{
g:netrw_liststyle = 1
g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
# }}}

# EasyMotion --------------------------------------------------{{{
nmap <leader>f <plug>(easymotion-s)
g:EasyMotion_smartcase = 1
# }}}

# CtrlP -------------------------------------------------------{{{
g:loaded_ctrlp = 1
g:ctrlp_user_command = 'rg --files %s'
g:ctrlp_show_hidden = 0
g:ctrlp_custom_ignore = "*.swp,*.zip,.git/*,build/*,.sass-cache.*,vendor,local,doc,db"
# nnoremap <leader>b :CtrlPBuffer<cr>

# fzf
if isdirectory('/opt/local/share/fzf/vim')
  set rtp+=/opt/local/share/fzf/vim
elseif isdirectory('/opt/homebrew/opt/fzf')
  set rtp+=/opt/homebrew/opt/fzf
elseif isdirectory('/usr/local/opt/fzf')
  set rtp+=/usr/local/opt/fzf
endif

g:fzf_layout = { 'down': '10' }
g:fzf_preview_window = []
g:fzf_colors = {
    'fg':      ['fg', 'GruvboxFg3', 'Normal'],
    'bg':      ['bg', 'Normal'],
    'hl':      ['fg', 'GruvboxFg1', 'Comment'],
    'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    'hl+':     ['fg', 'GruvboxYellow', 'Type', 'Statement'],
    'info':    ['fg', 'PreProc'],
    'border':  ['fg', 'Ignore'],
    'prompt':  ['fg', 'Comment'],
    'pointer': ['fg', 'Normal', 'Exception'],
    'marker':  ['fg', 'Keyword'],
    'spinner': ['fg', 'Label'],
    'header':  ['fg', 'Comment'],
}

def FindFiles()
    var git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[: -2]
    if git_dir != ''
        execute 'GFiles' git_dir ":^vendor"
    else
        execute 'Files'
    endif
enddef

command! ProjectFiles FindFiles()
nnoremap <silent> <C-P> :ProjectFiles<CR>
nnoremap <silent> <leader>b :Buffers<cr>

augroup ft_fzf
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
# }}}

# tabularize --------------------------------------------------{{{
nnoremap <silent> <Leader>= :Tabularize /=><CR>
vnoremap <silent> <Leader>= :Tabularize /=><CR>
# }}}

# Bufkill -----------------------------------------------------{{{
# Make c-x c-c write and close a buffer (useful for git commit
# edit messages, etc.)
nnoremap <C-x><C-c> :w<bar>BD<cr>
nnoremap <C-x><C-k> :w<bar>BW<cr>
# }}}

# ale

g:ale_lint_on_text_changed = 'never'
g:ale_lint_on_enter = 'never'
g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
# g:ale_rust_rustfmt_options = '+nightly'
g:ale_rust_cargo_check_tests = 1
g:ale_rust_cargo_check_all_targets = 1
g:ale_linters_explicit = 0

g:ale_linters = {
  perl: ['perl'],
  javascript: ['eslint', 'prettier'],
  typescript: ['eslint', 'prettier', 'tsserver'],
  rust: ['cargo', 'analyzer'],
  go: ['gopls', 'golangci-lint'],
}

g:ale_fixers = {
  javascript: ['prettier', 'eslint'],
  typescript: ['prettier'],
  json: ['prettier'],
  rust: ['rustfmt'],
  go: ['goimports'],
  python: ['autoflake'],
}

nnoremap <Leader>q <silent> :ALEFix<Enter>
nmap <Leader>e <Plug>(ale_detail)

# vim:fdm=marker
