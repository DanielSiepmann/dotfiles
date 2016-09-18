setlocal nospell

" Inherit markdown syntax for todo
runtime! syntax/markdown.vim

" syntax match TodoProject "|-.*-"
syntax match TodoDate " \a\{2\} \d\{2\}\.\d\{2\}"
syntax match TodoMark "\s*- \[ \]"
syntax match FeedbackMark "\s*- \[o\]"
syntax match Feedback "\s*->.*"
syntax match DoneTask "\s*- \[x\].*"
syntax region DeepUrl start="(" end=")"

hi TodoProject ctermfg=1
hi link TodoDate Error
hi link TodoMark Error
hi link Feedback Todo
hi DoneTask ctermfg=240
hi DeepUrl ctermfg=240

nnoremap <leader>d :s/\[ \]/[x]<cr> :nohlsearch<cr>
nnoremap <leader>t :s/\[x\]/[ ]<cr> :nohlsearch<cr>
