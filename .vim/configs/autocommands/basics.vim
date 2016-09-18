augroup general
    autocmd!
    " What does this do?! Were does it come from?
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " Delete fugitive buffer on leave
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

augroup code
    autocmd!
    " Remove whitespace at end of line
    autocmd BufWritePre *.erb,*.rb,*.php,*.html,*.js,*.css,*.vim,*.vimrc,*.scss :call StripTrailingWhitespace()
    " Reformat tabs and spaces depending on configuration
    autocmd BufNewFile,BufRead,BufWritePre *.erb,*.rb,*.xlf,*.xml,*.php,*.html,*.js,*.vim,*.vimrc :retab!
augroup END
