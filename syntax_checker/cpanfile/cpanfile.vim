"File:        cpanfile.vim
"Description: cpanfile syntax checking plugin for syntastic.vim
"Maintainer:  moznion <moznion[__at__]gmail.com>,
"License:     MIT License

let s:cpo_save = &cpo
set cpo&vim

function! SyntaxCheckers_cpanfile_cpanfile_IsAvailable()
  let l:module = 'Module::CPANfile'
  let l:err    = system("perl -M" . l:module . " -e ''")

  if l:err == ''
    return 1  " Successful
  endif

  return 0  " Failure
endfunction

let s:parser_name   = 'parse_cpanfile.pl'
let s:parse_command = 'perl ' . shellescape(expand('<sfile>:p:h') . '/' . s:parser_name)

function! SyntaxCheckers_cpanfile_cpanfile_GetLocList()
  let makeprg     = s:parse_command . ' ' . shellescape(expand('%'))
  let errorformat = '%t;%f;%l;%m'
  echo makeprg

  return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
  \ 'filetype': 'cpanfile',
  \ 'name': 'cpanfile'})

let &cpo = s:cpo_save
unlet s:cpo_save
