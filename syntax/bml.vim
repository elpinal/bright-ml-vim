" Vim syntax: Bright ML
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

if exists('b:current_syntax')
  finish
endif




syntax keyword bmlType int bool char string list unit
syntax keyword bmlKeyword
  \ struct sig val type module signature include open where
  \ datatype of let in fun function functor if then else false
  \ true match with end rec and pack unpack submodule

syntax match bmlArrow /\(->\|\~>\|=>\)/
syntax match bmlComment /\/\/.*/
syntax match bmlDecimal /\<\d\+\>/
syntax match bmlPunct /\(:>\|:\|=\(>\)\@!\)/
syntax match bmlLetOp /\<let\([+*&]\|\>\)/
syntax match bmlRawId /\<r#\h*/
syntax match bmlUpperId /\<\u\h*/

syntax region bmlString start=+"+ skip=+\\"+ end=+"+




highlight default link bmlType Type
highlight default link bmlComment Comment
highlight default link bmlDecimal Number
highlight default link bmlArrow Keyword
highlight default link bmlString String
highlight default link bmlLetOp Keyword
highlight default link bmlKeyword Keyword
highlight default link bmlPunct Keyword
highlight default link bmlRawId Normal
highlight default link bmlUpperId Special




let b:current_syntax = 'bml'

" __END__
" vim: foldmethod=marker
