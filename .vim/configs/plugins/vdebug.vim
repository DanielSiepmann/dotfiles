function! DebuggingConfiguration()
    "let g:vdebug_options={}
    " Connection infos
    " Wait 1 minute for connection
    let g:vdebug_options["timeout"] = 60
    let g:vdebug_options['ide_key'] = "vim"
    "let g:vdebug_options['port'] = 9000
    " Allow connections from everywhere.
    " E.g. vagrant images and such
    let g:vdebug_options['server'] = "0.0.0.0"
    " Plugin options
    let g:vdebug_options["break_on_open"] = 0
    let g:vdebug_options["watch_window_style"] = "compact"
    " Configure logging for debugging
    " let g:vdebug_options["debug_file_level"] = 11
    " let g:vdebug_options["debug_file"] = "/Users/siepmann/Projects/logs/vdebug.log"
    let g:vdebug_options["debug_file_level"] = 0
    let g:vdebug_options["debug_file"] = ""

    " Temporarly as Fkeys do not work
    let g:vdebug_keymap = {
                \    "run" : "<Leader>5",
                \    "step_over" : "<Leader>2",
                \    "step_into" : "<Leader>3",
                \    "step_out" : "<Leader>4",
                \    "close" : "<Leader>6",
                \}
    " For some reason, the above map doesn't work for run command.
    nmap <leader>5 :python debugger.run()<cr>
endfunction
