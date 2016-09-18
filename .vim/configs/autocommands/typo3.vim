augroup typo3
    autocmd!
    " Clear some caches depending on files saved. Only works if cwd is web root of TYPO3
    autocmd BufWritePost **/ext_tables.php :silent !rm typo3temp/Cache/Code/cache_core/ext_tables_*
    autocmd BufWritePost **/ext_tables.php :silent !rm web/typo3temp/Cache/Code/cache_core/ext_tables_*
    autocmd BufWritePost **/ext_localconf.php :silent !rm typo3temp/Cache/Code/cache_core/ext_localconf_*
    autocmd BufWritePost **/ext_localconf.php :silent !rm web/typo3temp/Cache/Code/cache_core/ext_localconf_*
    autocmd BufWritePost **/ext_localconf.php,**/ext_tables.php,**/TCA/** :silent !rm typo3temp/Cache/Code/cache_core/tca_base_*
    autocmd BufWritePost **/ext_localconf.php,**/ext_tables.php,**/TCA/** :silent !rm web/typo3temp/Cache/Code/cache_core/tca_base_*
    autocmd BufWritePost **/*.xlf :silent !rm typo3temp/Cache/Data/l10n/*
    autocmd BufWritePost **/*.xlf :silent !rm web/typo3temp/Cache/Data/l10n/*
    " For older TYPO3 Versions
    autocmd BufWritePost **/ext_localconf.php,**/ext_tables.php :silent !rm typo3conf/temp_CACHED_*
    autocmd BufWritePost **/ext_localconf.php,**/ext_tables.php :silent !rm web/typo3conf/temp_CACHED_*

    " Fix draw issue after potential error message in tmux environment
    " => Should fix output instead of forcing redraw, just workaround.
    autocmd BufWritePost **/*.xlf,**/ext_localconf.php,**/ext_tables.php,**/TCA/** :redraw!
augroup END
