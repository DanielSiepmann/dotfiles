" Use existing tags file for root detection
" Don't use default like .git because of subprojects like php composer vendor.
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['tags']
