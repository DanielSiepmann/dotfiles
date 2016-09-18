augroup vdebug
    autocmd!
    " Don't fold in debugger as he uses his own collapse feature.
    autocmd BufEnter Debugger* setlocal foldlevel=99
augroup END

