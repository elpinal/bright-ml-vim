" Vim indent: Bright ML
" Version: 0.0.0
" Copyright (C) 2020 El Pin Al
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('b:did_indent')
  finish
endif




setlocal autoindent
setlocal indentexpr=GetBMLIndent()
setlocal indentkeys=!^F,o,O,0<bar>,0=then,0=else,0=in,0=end

setlocal expandtab
setlocal tabstop<
setlocal softtabstop=2
setlocal shiftwidth=2

let b:undo_indent = 'setlocal '.join([
\   'autoindent<',
\   'expandtab<',
\   'indentexpr<',
\   'indentkeys<',
\   'shiftwidth<',
\   'softtabstop<',
\   'tabstop<',
\ ])




function! GetBMLIndent()
  let plnum = prevnonblank(v:lnum - 1)

  if getline(v:lnum) =~# '\v<end>'
    if getline(plnum) =~# '\v<struct|sig|function|with>\s*$'
      return indent(plnum)
    endif

    return indent(plnum) - &l:shiftwidth
  endif

  if getline(plnum) =~# '\v<struct|sig|function|with>\s*$' || getline(plnum) =~# '=\s*$'
    return indent(plnum) + &l:shiftwidth
  endif

  if getline(plnum) =~# '^\s*|' && getline(plnum) =~# '->\s*$'
    return indent(plnum) + &l:shiftwidth * 2
  endif

  return -1
endfunction




let b:did_indent = 1

" __END__
" vim: foldmethod=marker
