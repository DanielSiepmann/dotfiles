" Enter Presentation mode and set settings
function! Present()
    " GUI
    set guifont=Consolas:h27

    set background=light
    colorscheme lightning

    " Statusline
    set statusline=%t "Show file name
    set statusline+=\ by\ Daniel\ Siepmann "Show file name
    set statusline+=%= "Switch to right
    set statusline+=\ %3p%% "Show percentage of file.

    " Features
    setlocal nonumber
    setlocal nospell

    " Open the first level as default
    set foldlevelstart=0

    syntax off
endfunction

let present=$PRESENT

if present == '1'
    call Present()
endif
