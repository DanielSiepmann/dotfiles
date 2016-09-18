" Activate spell chechking in xml files, within tags only
set spell spelllang=en
syn spell toplevel
" Disable spell chacking in attributes
syn region  xmlString contained start=+"+ end=+"+ contains=xmlEntity,@NoSpell display
syn region  xmlString contained start=+'+ end=+'+ contains=xmlEntity,@NoSpell display
