" Remove quick help etc.
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autopreview = 1

let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'sort' : 0,
    \ 'kinds'   : [
        \ 'n:namespaces:1',
        \ 'a:alias:1',
        \ 'i:interfaces:1',
        \ 't:traits:1',
        \ 'c:classes:1',
        \ 'd:constantDefinitions:1',
        \ 'f:functions:0',
    \ ]
\ }

" Show headlines within markdown files
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:headings'
            \ ],
            \ 'sort' : 0,
            \ }

" Show parts of rst files
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '~/bin/rst2ctags/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

let g:tagbar_ctags_bin='ctags'
