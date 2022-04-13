let b:mto_open_tag = "<?php "
let b:mto_close_tag = "?>"

" Stolen from https://stackoverflow.com/a/1534347/1824895
function! s:get_visual_selection()
  normal! gv"zy
  return @z
endfunction

function! s:_one_arg(prompt, php_func_name, add_dollar=0)
  let z_old = @z

  " grab the thing, ask for new one
  let selected = s:get_visual_selection()
  let varname = input(a:prompt . " (" . selected . "): ")

  " probably, hit escape. don't blat the selection
  if varname ==# ''
    return
  endif

  let subbed = substitute(varname, " ", "_", "")

  " put it there
  let bits = [
    \ b:mto_open_tag, a:php_func_name, '(',
    \ (a:add_dollar ? '$' : ''), subbed,
    \ ')', b:mto_close_tag
  \ ]
  let @z = join(bits, '')
  normal! gv"zp

  let @z = z_old
  redraw
endfunction

function s:_citeone(php_func_name)
  call s:_one_arg('Variable name', a:php_func_name, 1)
endfunction

" I am ignoring, in the translation to vimscript, the two-arg functions,
" because mostly I have stopped using them.

function! s:cite()
  call s:_citeone('cite')
endfunction

function! s:cite_year()
  call s:_citeone('cite_year')
endfunction

function! s:sharp()
  call s:_one_arg('Note name', 'sharp')
endfunction

function! s:flat()
  call s:_one_arg('Note name', 'flat')
endfunction

function! s:natural()
  call s:_one_arg('Note name', 'natural')
endfunction

function! s:activate()
  let is_fn = input("Is this a footnotes file? [y/n] ") ==# "y"
  if is_fn
      let b:mto_open_tag = '".fn_'
      let b:mto_close_tag = '."'
  else
      let b:mto_open_tag = '<?php '
      let b:mto_close_tag = '?>'
  endif

  if exists('b:mto_activated') && b:mto_activated
    redraw
    return
  endif

  " load mappings
  xmap <buffer><nowait> <LocalLeader>c <Plug>MTOCite
  xmap <buffer> <LocalLeader>y <Plug>MTOCiteYear
  xmap <buffer> <LocalLeader>s <Plug>MTOSharp
  xmap <buffer> <LocalLeader>f <Plug>MTOFlat
  xmap <buffer> <LocalLeader>n <Plug>MTONatural

  " random shit
  noremap <buffer> n gj
  noremap <buffer> e gk
  noremap <buffer> 0 g0
  vmap ,i S<i>
  vmap ,b S<b>
  vmap ,s S<sub>

  hi link htmlSpecialChar Comment

  setl nolist
  setl linebreak
  setl textwidth=0

  " macros
  let @p = 'U<p>A</p>0{j'
  let @s = 'U<p style="text-align:center"><b>A</b></p>0'
  let @q = 'yt.jj"_dt.P0'

  let b:mto_activated = 1

  redraw
endfunction

vnoremap <silent> <Plug>MTOCite     :<C-U>call <SID>cite()<CR>
vnoremap <silent> <Plug>MTOCiteYear :<C-U>call <SID>cite_year()<CR>
vnoremap <silent> <Plug>MTOSharp    :<C-U>call <SID>sharp()<CR>
vnoremap <silent> <Plug>MTOFlat     :<C-U>call <SID>flat()<CR>
vnoremap <silent> <Plug>MTONatural  :<C-U>call <SID>natural()<CR>

command! MTOActivate call s:activate()
