" Configure when to check
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" Configure how to check
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_stl_format = "[E:%F %t]"

" Checkers
let g:syntastic_rst_checkers = ["sphinx"]
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_json_checkers = ["jshint"]
let g:syntastic_python_checkers = ["python","pep8"]
" let g:syntastic_javascript_jshint_exec = '/usr/local/bin/jshint'
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_phpcs_args="--report=csv"
let g:syntastic_mode_map={ 'mode': 'active' }
let g:syntastic_filetype_map = { 'json': 'javascript' }
" let g:syntastic_mode_map={ 'mode': 'active',
"             \ 'active_filetypes': [],
"             \ 'passive_filetypes': ['html'] }
