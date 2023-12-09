vim9script

b:mto_open_tag = "<?php "
b:mto_close_tag = "?>"

# Stolen from https://stackoverflow.com/a/1534347/1824895
def GetVisualSelection(): string
  normal! gv"zy
  return @z
enddef

def OneArg(prompt: string, php_func_name: string, add_dollar: bool = false)
  var z_old = @z

  # grab the thing, ask for new one
  var selected = GetVisualSelection()
  var varname = input(prompt .. " (" .. selected .. "): ")

  # probably, hit escape. don't blat the selection
  if varname ==# ''
    return
  endif

  var subbed = substitute(varname, " ", "_", "")

  # put it there
  var bits = [
    b:mto_open_tag, php_func_name, '(',
    (add_dollar ? '$' : ''), subbed,
    ')', b:mto_close_tag
  ]
  @z = join(bits, '')
  normal! gv"zp

  @z = z_old
  redraw
enddef

def CiteOne(php_func_name: string)
  OneArg('Variable name', php_func_name, 1)
enddef

# I am ignoring, in the translation to vimscript, the two-arg functions,
# because mostly I have stopped using them.

def Cite()
  CiteOne('cite')
enddef

def CiteYear()
  CiteOne('cite_year')
enddef

def Sharp()
  OneArg('Note name', 'sharp')
enddef

def Flat()
  OneArg('Note name', 'flat')
enddef

def Natural()
  OneArg('Note name', 'natural')
enddef

def Scaledegree()
  OneArg('Scale degree', 'scaledegree')
enddef

def Activate()
  set filetype=php

  var is_fn = input("Is this a footnotes file? [y/n] ") ==# "y"
  if is_fn
      b:mto_open_tag = '".fn_'
      b:mto_close_tag = '."'
  else
      b:mto_open_tag = '<?php '
      b:mto_close_tag = '?>'
  endif

  if exists('b:mto_activated') && b:mto_activated
    redraw
    return
  endif

  # load mappings
  xmap <buffer><nowait> <LocalLeader>c <Plug>MTOCite
  xmap <buffer> <LocalLeader>y <Plug>MTOCiteYear
  xmap <buffer> <LocalLeader>s <Plug>MTOSharp
  xmap <buffer> <LocalLeader>f <Plug>MTOFlat
  xmap <buffer> <LocalLeader>n <Plug>MTONatural
  xmap <buffer> <LocalLeader>h <Plug>MTOScaledegree

  # random shit
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

  # macros
  @l = "vt\"hygvS<a href='\"'>nekkk"
  @p = 'U<p>A</p>0{j'
  @s = 'U<p style="text-align:center"><b>A</b></p>0'
  @q = 'yt.jj"_dt.P0'

  b:mto_activated = 1

  redraw
enddef

vnoremap <silent> <Plug>MTOCite     :<C-U>call <SID>Cite()<CR>
vnoremap <silent> <Plug>MTOCiteYear :<C-U>call <SID>CiteYear()<CR>
vnoremap <silent> <Plug>MTOSharp    :<C-U>call <SID>Sharp()<CR>
vnoremap <silent> <Plug>MTOFlat     :<C-U>call <SID>Flat()<CR>
vnoremap <silent> <Plug>MTONatural  :<C-U>call <SID>Natural()<CR>
vnoremap <silent> <Plug>MTOScaledegree :<C-U>call <SID>Scaledegree()<CR>

command! MTOActivate Activate()
