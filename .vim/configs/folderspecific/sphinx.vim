" Special configuration for sphinx documentations
augroup sphinxFolder
    autocmd!
    " Ignore build folder for grepping
    autocmd BufRead,BufNewFile **/Projects/own/website/*,**/sphinx/*,**/Documentation/* execute ':let g:ctrlp_user_command = g:dsiepmann_user_command . " --ignore \"build\""'
augroup END
