" Misc. vim settings for random plugins

" netrw -------------------------------------------------------{{{
nnoremap <F5> :e .<CR>
let g:netrw_liststyle=3     " tree style
" }}}

" EasyMotion --------------------------------------------------{{{
nmap <leader>f <plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
" }}}

" CtrlP -------------------------------------------------------{{{
let g:ctrlp_user_command = 'rg --files %s'
" let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 0
let g:ctrlp_custom_ignore = "*.swp,*.zip,.git/*,build/*,.sass-cache.*,vendor,local,doc,db"
nnoremap <leader>b :CtrlPBuffer<cr>
" }}}

" tabularize --------------------------------------------------{{{
nnoremap <silent> <Leader>= :Tabularize /=><CR>
vnoremap <silent> <Leader>= :Tabularize /=><CR>
" }}}

" fugitive
augroup fugitive
    au!
    au FileType fugitiveblame silent! nunmap <buffer> q:
augroup END


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
let g:ale_linters = {
\   'perl': ['perl'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
nnoremap <Leader>q <silent> :ALEFix<Enter>

" vim:fdm=marker
