let g:phpgetset_getterTemplate =
            \ "    \n" .
            \ "    /**\n" .
            \ "     * @return TYPE\n" .
            \ "     */\n" .
            \ "    public function %funcname%()\n" .
            \ "    {\n" .
            \ "        return $this->%varname%;\n" .
            \ "    }"
let g:phpgetset_setterTemplate =
            \ "    \n" .
            \ "    /**\n" .
            \ "     * @param TYPE $%varname%\n" .
            \ "     * @return void\n" .
            \ "     */\n" .
            \ "    public function %funcname%($%varname%)\n" .
            \ "    {\n" .
            \ "        $this->%varname% = $%varname%;\n" .
            \ "    }"
