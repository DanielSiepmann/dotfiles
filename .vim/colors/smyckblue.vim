" ----------------------------------------------------------------------------
" Vim color file
" Maintainer:   John-Paul Bader <contact@smyck.org>
" Modifier:     Daniel Siepmann <coding@daniel-siepmann.de>
" Last Change:  2015 July
" License:      Beer Ware
" ----------------------------------------------------------------------------

" Reset Highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
set linespace=3

let g:colors_name = "smyckblue"

" ----------------------------------------------------------------------------
" Vim scheme
" ----------------------------------------------------------------------------
hi ColorColumn          cterm=bold ctermbg=1        ctermfg=15
hi ColumnMargin         cterm=none ctermbg=0                        gui=none        guibg=#000000
hi ColumnMargin         cterm=none ctermbg=none     ctermfg=none
hi CursorColumn         cterm=none ctermbg=238      ctermfg=none    gui=none        guibg=#424242
hi CursorLine           cterm=none ctermbg=237      ctermfg=none    gui=none        guibg=#424242
hi Directory            cterm=none ctermbg=none     ctermfg=4       gui=none        guibg=#242424   guifg=#88CCE7
hi Error                cterm=none ctermbg=1        ctermfg=15      gui=none                        guifg=#F7F7F7
hi ErrorMsg             cterm=none ctermbg=1        ctermfg=15      gui=none                        guifg=#F7F7F7
hi FoldColumn           cterm=none ctermbg=none     ctermfg=150     gui=none        guibg=#3B3B3B   guifg=#90AB41
hi Folded               cterm=none ctermbg=236      ctermfg=150     gui=none        guibg=#3B3B3B   guifg=#90AB41
hi IncSearch            cterm=none ctermbg=3        ctermfg=8       gui=none        guibg=#F6DC69   guifg=#8F8F8F
hi LineNr               cterm=none ctermbg=none     ctermfg=8       gui=none        guibg=#282828   guifg=#8F8F8F
hi MatchParen           cterm=none ctermbg=14       ctermfg=0       gui=none        guibg=#2EB5C1   guifg=#F7F7F7
hi ModeMsg              cterm=bold ctermbg=none     ctermfg=10      gui=none
hi NonText              cterm=bold ctermbg=none     ctermfg=8       gui=bold                        guifg=#8F8F8F
hi Normal               cterm=none ctermbg=none     ctermfg=15      gui=none        guibg=#282828   guifg=#F7F7F7
hi Pmenu                cterm=none ctermbg=238      ctermfg=15      gui=none        guibg=#8F8F8F   guifg=#F7F7F7
hi PmenuSbar            cterm=none ctermfg=238      ctermfg=8       gui=none        guibg=#F7F7F7   guifg=#8F8F8F
hi PmenuSel             cterm=none ctermbg=236      ctermfg=blue    gui=none        guibg=#F7F7F7   guifg=#8F8F8F
hi Search               cterm=none ctermbg=14       ctermfg=0       gui=none        guibg=#2EB5C1   guifg=#F7F7F7
hi SignColumn           cterm=none ctermbg=none     ctermfg=none
hi SpecialKey           cterm=none ctermbg=none     ctermfg=8       gui=none                        guifg=#8F8F8F
hi StatusLine           cterm=none ctermbg=238      ctermfg=15      gui=none        guibg=#5D5D5D   guifg=#FBFBFB
hi StatusLineNC         cterm=bold ctermbg=234      ctermfg=8       gui=none        guibg=#5D5D5D   guifg=#FBFBFB
hi TabLine              cterm=none ctermbg=none     ctermfg=242
hi TabLineFill          cterm=none ctermbg=none     ctermfg=237
hi TabLineSel           cterm=none ctermbg=none     ctermfg=blue
hi Title                cterm=none ctermbg=none     ctermfg=4       gui=none                        guifg=#88CCE7
hi VertSplit            cterm=none ctermbg=none     ctermfg=blue
hi Visual               cterm=none ctermbg=15       ctermfg=8       gui=none        guibg=#F7F7F7   guifg=#8F8F8F
hi WildMenu             cterm=none ctermbg=none     ctermfg=blue

" ----------------------------------------------------------------------------
" Syntax Highlighting
" ----------------------------------------------------------------------------
hi Comment        cterm=none ctermbg=none ctermfg=242       gui=none        guifg=#8F8F8F
hi Constant       cterm=none ctermbg=none ctermfg=12        gui=none        guifg=#96D9F1
hi Delimiter      cterm=none ctermbg=none ctermfg=15        gui=none        guifg=#F7F7F7
hi Identifier     cterm=none ctermbg=none ctermfg=12        gui=none        guifg=#96D9F1
hi Ignore         cterm=none ctermbg=none ctermfg=8         gui=none        guifg=bg
hi Interpolation  cterm=none ctermbg=none ctermfg=6         gui=none        guifg=#2EB5C1
hi Keyword        cterm=none ctermbg=none ctermfg=10        gui=none        guifg=#D1FA71
hi Method         cterm=none ctermbg=none ctermfg=15        gui=none        guifg=#F7F7F7
hi PreProc        cterm=none ctermbg=none ctermfg=10        gui=none        guifg=#D1FA71
hi Special        cterm=none ctermbg=none ctermfg=6         gui=none        guifg=#d7d7d7
hi Statement      cterm=none ctermbg=none ctermfg=10        gui=none        guifg=#D1FA71
hi String         cterm=none ctermbg=none ctermfg=249       gui=none        guifg=#F6DC69
hi Structure      cterm=none ctermbg=none ctermfg=12        gui=none        guifg=#9DEEF2
hi Symbol         cterm=none ctermbg=none ctermfg=9         gui=none        guifg=#FAB1AB
hi Type           cterm=none ctermbg=none ctermfg=12        gui=none        guifg=#96D9F1
hi Underlined     cterm=none ctermbg=none ctermfg=magenta   gui=underline   guibg=#272727
hi link Number String

hi Error          cterm=none ctermbg=none ctermfg=red
hi Todo           cterm=none ctermbg=none ctermfg=yellow

" Diff
hi DiffAdd              cterm=bold ctermbg=2        ctermfg=15
hi DiffChange           cterm=bold ctermbg=4        ctermfg=15
hi DiffDelete           cterm=bold ctermbg=1        ctermfg=15
hi DiffText             cterm=bold ctermbg=3        ctermfg=8

" Spell
hi SpellBad             cterm=none ctermbg=1        ctermfg=15      gui=none                        guifg=#F7F7F7
hi SpellCap             cterm=none ctermbg=4        ctermfg=15      gui=none                        guifg=#F7F7F7
hi SpellLocal           cterm=none ctermbg=4        ctermfg=15      gui=none                        guifg=#F7F7F7
hi SpellRare            cterm=none ctermbg=4        ctermfg=15      gui=none                        guifg=#F7F7F7

" Erlang
hi link erlangAtom            Keyword
hi link erlangBitType         Keyword

" Ruby
hi link rubyBeginend          Keyword
hi link rubyClass             Keyword
hi link rubyClassVariable     Method
hi link rubyClassVariable     Symbol
hi link rubyConditional       Keyword
hi link rubyConstant          Constant
hi link rubyControl           Keyword
hi link rubyFunction          Constant
hi link rubyGlobalVariable    Constant
hi link rubyIdentifier        Keyword
hi link rubyInstanceVariable  Constant
hi link rubyInterpolation     Interpolation
hi link rubyInterpolationDelimiter    Interpolation
hi link rubyKeyword           Keyword
hi link rubyModule            Keyword
hi link rubyOperator          Method
hi link rubyRailsMethod       Method
hi link rubySymbol            Symbol

" PHP
hi link phpParent phpRegion
