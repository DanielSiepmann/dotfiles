augroup vim
    autocmd!
    " Autoreload vimrc on save
    autocmd BufWritePost .vimrc source ~/.vimrc
    " Autoreload color scheme on save
    autocmd BufWritePost .vim/colors/* execute ":colorscheme " . expand("%:t:s/.vim//")
augroup END
