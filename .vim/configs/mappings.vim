" Custom Mapping / Key bindings
let mapleader = ","

nnoremap H ^
nnoremap L $
" Toggle paste mode
map <leader>v :set paste!<cr>
" Toggle line numbers
map <leader>nb :set number!<cr>
" Configure navigation, e.g. go to buffer, file, ...
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>l :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>r :CtrlPBufTag<cr>
" Find current file in NERDTree.
nnoremap <leader>f :NERDTreeFind<cr>
" Toggle tag bar showing tags in current buffer
nnoremap <leader>b :TagbarOpenAutoClose<cr>
nnoremap <leader>k :NERDTreeToggle<cr>
" Stop highlighting of search results.
nnoremap <leader>nh :nohlsearch<cr>
" Execute current line in shell
" nnoremap <leader>q !!sh<cr>
" Open current file in marked (markdown).
nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>:redraw!<cr>
" Sudo to write / doesnt work?
cnoremap w!! w !sudo tee % >/dev/null<cr>
" Start VDebug
nmap <leader>db :call StartDebugging()<cr>
" Toggle syntastic
nmap <leader>s :SyntasticToggleMode<cr>
" Make current buffer full size (fs)
nmap <leader>fs :resize<cr>

" Insert PHP Getter & Setter
nmap <leader>gs :InsertBothGetterSetter<cr>

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif
