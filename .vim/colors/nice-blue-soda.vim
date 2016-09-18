
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "nice-blue-soda"

let s:general_background = '#222222'
let s:general_foreground = '#C7C7C7'
let s:light_blue_foreground = '#08E8C1'
let s:black = '#000000'
let s:cursor_line_gb = '#333333'

let s:grey_blue = '#8a9597'
let s:light_grey_blue = '#a0a8b0'
let s:dark_grey_blue = '#34383c'
let s:mid_grey_blue = '#64686c'
let s:beige = '#ceb67f'
let s:light_orange = '#ebc471'
let s:yellow = '#e3d796'
let s:violet = '#a999ac'
let s:green = '#a2a96f'
let s:lightgreen = '#c2c98f'
let s:red = '#d08356'
let s:cyan = '#74dad9'
let s:darkgrey = '#1a1a1a'
let s:grey = '#303030'
let s:lightgrey = '#605958'
let s:white = '#fffedc'


if version >= 700
  hi CursorLine guibg=#333333
  exe 'hi CursorColumn guibg='.s:general_foreground
  exe 'hi MatchParen guifg='.s:black.' guibg='.s:light_blue_foreground

  "Tabpages
  hi TabLine guifg=#a09998 guibg=#202020 gui=underline
  hi TabLineFill guifg=#a09998 guibg=#202020 gui=underline
  hi TabLineSel guifg=#a09998 guibg=#404850 gui=underline

  "P-Menu (auto-completion)
  hi Pmenu guifg=#605958 guibg=#303030 gui=underline
  hi PmenuSel guifg=#a09998 guibg=#404040 gui=underline
  "PmenuSbar
  "PmenuThumb
endif

hi Visual guibg=#404040
hi Cursor guibg=#b0d0f0
hi ColorColumn ctermbg=lightgrey guibg=#515151

exe 'hi Normal         guifg='.s:general_foreground.' guibg='.s:general_background
exe 'hi Underlined     guifg='.s:general_foreground.' guibg='.s:general_background        .' gui=underline'
exe 'hi NonText        guifg='.s:lightgrey         .' guibg='.s:grey
exe 'hi SpecialKey     guifg='.s:grey              .' guibg='.s:general_background

exe 'hi LineNr         guifg='.s:general_foreground.' guibg='.s:general_background  .' gui=none'
exe 'hi CursorLineNr   guifg='.s:general_foreground.' guibg='.s:cursor_line_gb      .' gui=none'
exe 'hi StatusLine     guifg='.s:general_foreground.' guibg='.s:cursor_line_gb      .' gui=italic,underline'
exe 'hi StatusLineNC   guifg='.s:general_foreground.' guibg='.s:grey            .' gui=italic,underline'

exe 'hi Comment        guifg=#515151                  guibg='.s:general_background        .' gui=italic'

exe 'hi Constant       guifg='.s:light_blue_foreground.' guibg='.s:general_background        .' gui=none'
exe 'hi String         guifg=#BABABA                  guibg='.s:general_background        .' gui=none'
exe 'hi Special        guifg='.s:general_foreground .' guibg='.s:general_background        .' gui=none'

exe 'hi Identifier     guifg=#728E9C                  guibg='.s:general_background        .' gui=none'
exe 'hi Statement      guifg=#6FC7F6                  guibg='.s:general_background        .' gui=none'
"  exe 'hi Repeat         guifg='.s:beige             .' guibg='.s:general_background        .' gui=none'
exe 'hi Structure     guifg='.s:beige             .' guibg='.s:general_background        .' gui=none'
exe 'hi Function      guifg='.s:light_blue_foreground.' guibg='.s:general_background        .' gui=none'

exe 'hi PreProc        guifg='.s:light_blue_foreground.' guibg='.s:general_background        .' gui=none'
exe 'hi Operator       guifg=#728E9C                  guibg='.s:general_background        .' gui=none'
exe 'hi Type           guifg='.s:general_foreground.' guibg='.s:general_background        .' gui=italic'

hi Search guifg=#606000 guibg=#c0c000 gui=bold

exe 'hi Directory guifg='.s:general_foreground.' gui=NONE'
exe 'hi NERDTreeDir guifg='.s:general_foreground
hi Error guibg=#602020

