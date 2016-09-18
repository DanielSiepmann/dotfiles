" Function to test a specific URL.
" Will output the response + response headers for the given URL.
function! TestUrl(url)
    execute ":!wget -q -O - --no-check-certificate --server-response '" . a:url . "'"
endfunction

" Copy the current file name to clipboard
function! CopyFileName()
    execute ':let @+ = expand("%:t")'
endfunction

" Copy the current relative file path to clipboard
function! CopyRelativeFilePath()
    execute ':let @+ = expand("%")'
endfunction

" Copy the current full file path to clipboard
function! CopyFullFilePath()
    execute ':let @+ = expand("%:p")'
endfunction

" Remove trailing whitespace
function! StripTrailingWhitespace()
    execute ':%s/\s\+$//e'
endfunction

function! RemoveEmptyLines()
    execute ':g/^\s*$/d'
endfunction

function! ReplaceLineBreaks()
    execute ':%s//\r/g'
endfunction

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! StartDebugging()
    call DebuggingConfiguration()
    VdebugStart
endfunc

function! HiColors()
    let num = 255
    while num >= 0
        exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
        exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
        call append(0, 'ctermbg='.num.':....')
        let num = num - 1
    endwhile
endfunction

" Author: http://vimrcfu.com/snippet/116
function! Reg()
    reg
    echo "Register: "
    let char = nr2char(getchar())
    if char != "\<Esc>"
        execute "normal! \"".char."p"
    endif
    redraw
endfunction

" Generate .. _: anchor for headline. Cursor have to be on line with headline.
function! SphinxAnchor()
    normal yyOPI.. _lguuA:V:s/ /-/gllr jj
endfunction

command! -nargs=0 Reg call Reg()
