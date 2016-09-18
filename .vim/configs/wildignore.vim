" Ignore some files and folders
set wildignore+=*/tags
" Version and other general unimportant files.
set wildignore+=*.rej
set wildignore+=*.orig
set wildignore+=*.resolve
set wildignore+=*.swp
" Python
set wildignore+=*.pyc
" Ruby on Rails
set wildignore+=*/tmp/*
" Node.js
set wildignore+=*/node_modules
" set wildignore+=*/bower_components
" PHP Projects
set wildignore+=composer.lock
" TYPO3 FLOW
set wildignore+=*/Build
set wildignore+=*/Data
set wildignore+=*/_build
" Not possible in TYPO3 installations
" set wildignore+=Web
set wildignore+=bin
set wildignore+=**/*.bat
" TYPO3
" set wildignore+=*/typo3_src*
set wildignore+=*/_migrated/*
set wildignore+=*/_processed_/*
set wildignore+=*/_temp_/*
set wildignore+=*/fileadmin/images/*
set wildignore+=*/fileadmin/mediapool/*
set wildignore+=*/fileadmin/user_upload/*
set wildignore+=*/typo3conf/l10n
set wildignore+=*/typo3temp
set wildignore+=*/uploads
