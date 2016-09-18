" Setup for TYPO3 documentation in restructuredtext
" setlocal noexpandtab
setlocal textwidth=100

setlocal spell spelllang=en
syn spell toplevel

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

execute ':Vst foldr'
" setlocal foldlevel=0
