" Misc. vim settings for random plugins

" airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}

    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_powerline_fonts=0
    let g:airline_section_z = '%3p%% (%v,%l)'

    set noshowmode
endif

function! AirlineInit()
  " this used to work without being in a function, but no longer does.
  call airline#parts#define('linenr', {
              \ 'raw': '%-9((%l,%v)%)',
              \ 'accent': 'bold'})
  let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%% ', 'linenr'])
endfunction

au VimEnter * call AirlineInit()

" netrw -------------------------------------------------------{{{
let g:netrw_liststyle=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" }}}

" EasyMotion --------------------------------------------------{{{
nmap <leader>f <plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
" }}}

" CtrlP -------------------------------------------------------{{{
let g:loaded_ctrlp = 1
let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_show_hidden = 0
let g:ctrlp_custom_ignore = "*.swp,*.zip,.git/*,build/*,.sass-cache.*,vendor,local,doc,db"
" nnoremap <leader>b :CtrlPBuffer<cr>

" fzf
set rtp+=/opt/local/share/fzf/vim
let g:fzf_layout = { 'down': '10' }
let g:fzf_preview_window = []
let g:fzf_colors =
\ { 'fg':      ['fg', 'GruvboxFg3', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'GruvboxFg1', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'GruvboxYellow', 'Type', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Comment'],
  \ 'pointer': ['fg', 'Normal', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir != ''
        execute 'GFiles' git_dir
    else
        execute 'Files'
    endif
endfunction
command! ProjectFiles execute s:find_files()
nnoremap <silent> <C-P> :ProjectFiles<CR>
nnoremap <silent> <leader>b :Buffers<cr>

augroup ft_fzf
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
" }}}

" tabularize --------------------------------------------------{{{
nnoremap <silent> <Leader>= :Tabularize /=><CR>
vnoremap <silent> <Leader>= :Tabularize /=><CR>
" }}}

" vim-pandoc---------------------------------------------------{{{
let g:pandoc_use_hard_wraps = 1
let g:pandoc_auto_format = 0
let g:pandoc_no_empty_implicits = 0
let g:pandoc_no_folding = 1
let g:pandoc_no_spans = 1
augroup ft_pandoc
    au!
    au Filetype pandoc setlocal tabstop=2 shiftwidth=2 textwidth=78
augroup END
" }}}

" Bufkill -----------------------------------------------------{{{
" Make c-x c-c write and close a buffer (useful for git commit
" edit messages, etc.)
nnoremap <C-x><C-c> :w<bar>BD<cr>
nnoremap <C-x><C-k> :w<bar>BW<cr>
" }}}

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 'never'
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_rust_rustfmt_options = '+nightly'
let g:ale_rust_cargo_check_tests = 1
let g:ale_linters_explicit = 0
let g:ale_linters = {
\   'perl': ['perl'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier', 'tsserver'],
\   'rust': ['cargo', 'analyzer'],
\   'go': ['gofmt', 'gobuild', 'golint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'json': ['prettier'],
\   'rust': ['rustfmt'],
\   'go': ['gofmt', 'goimports'],
\}

nnoremap <Leader>q <silent> :ALEFix<Enter>
nmap <Leader>e <Plug>(ale_detail)

" vim:fdm=marker
