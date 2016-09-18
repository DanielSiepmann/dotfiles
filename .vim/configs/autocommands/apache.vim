augroup apache
    autocmd!
    " Restart apache if config was changed
    " Not inside ftplugin as it's for multiple files.
    autocmd BufWritePost **/apache.conf,**/vhosts.conf,**/php.ini :!sudo apachectl restart
augroup END
