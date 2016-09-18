set statusline=%h%w "Show modi, help, preview.
set statusline+=\ %f "Show file name
set statusline+=%= "Switch to right side.
set statusline+=%m "Show modification of file
set statusline+=%r "Show readonly mode of file
" Showing syntax highlight group in statusline
" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" function! SyntaxItem()
"     return synIDattr(synID(line("."),col("."),1),"name")
" endfunction
" set statusline+=%{SyntaxItem()}
" Show information from git
" set statusline+=%{fugitive#head()}
" Show syntastic errors
set statusline+=%#warningmsg#
if g:ds_hostname !~ "euve.*"
    set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*
" Proceed with status line
set statusline+=%y "Show filetype
set statusline+=[%{&fileencoding?&fileencoding:&encoding}] " Show encoding
set statusline+=[%{&ff}] "Show lineendings
set statusline+=\ %c "Show current column.
set statusline+=,%4l "Show current line.
set statusline+=/%L "Show total line count.
set statusline+=\ %3p%% "Show percentage of file.
