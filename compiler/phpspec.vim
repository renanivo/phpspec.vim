" Vim compiler file
" Language:                PHPSpec
" Maintainer:              Renan Ivo <renanivom@gmail.com>
" URL:                     https://github.com/renanivo/phpspec.vim

if exists("current_compiler")
  finish
endif
let current_compiler = "phpspec"

if exists(":CompilerSet") != 2                " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=/usr/local/bin/php\ ./bin/phpspec\ run\ --verbose\ -f\ dot
CompilerSet errorformat=
    \%Z%.%#1\ %f:%l,
    \%E\ \ %.%#\ \ ✘\ %m,
    \%E\ \ %.%#\ \ !\ %m,
    \%C\ \ \ \ \ \ %m,
    \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
