" .vimrc from Daniel Siepmann <coding@daniel-siepmann.de>

" Some basics to set vim up specially the 'gui'
let g:ds_hostname = substitute(system('hostname'), '\n', '', '')

set background=dark
if has("gui_running")
    " Configure GUI like MacVim
    colorscheme smyckblue
    augroup fullscreen
        autocmd!
        autocmd GUIEnter * set fullscreen
        autocmd GUIEnter * set transparency=0
    augroup END
    set spell spelllang=en
else
    set t_Co=256
    colorscheme smyckblue
endif

set timeoutlen=1000
set ttimeoutlen=1000

" Special configuration only valid in neovim or classic vim
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    " Don't use it for now, as color scheme is not "compatible"
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
    " Define whether tty (terminal) is fast or not.
    set nottyfast
endif
" Don't redraw while executing macros, is default
" set lazyredraw

" Show line numbers.
set nonumber
" Why the hell should I do that? It just irritates while browsing code,
" showing code and talking about code. I can also do countg instead of countj
" set relativenumber " show relative line numbers

" Folding
" Show column to indicate open and closed folds
" Don't show a column, to save view
set foldcolumn=0
" As indent is most of the time already there and supported instead of syntax
" or something else. So it's default and other methods have to be configured
" as they are supported.
set foldmethod=indent
" Open the first level as default
set foldlevelstart=1
" Always show the status line, even if just one buffer is active
set laststatus=2

" Don't jump to first line, e.g. on buffer switch
set nostartofline

" Extend completion using spelling if enabled for buffer.
set complete+=kspell

" Allow syntax highlighting and other file / language specific things
syntax enable
" Activate filetype detection and auto indent
filetype plugin indent on

" Show command in bottom of the screen
set showcmd
set showmode
" More useful command-line completion
set wildmenu
" Auto-completion menu
set wildmode=longest,list:full

" Disable wrap of line
set nowrap
" Test line for wrapping: This should be a very long line with many characters and words so I can test whether this Line get's wrapped or not and how other settings like sidescroll are applied.
set sidescrolloff=5
" Show current line in middle of screen
set scrolloff=1000

" Copy & Paste
" Use system clipboard as yank default
" No longer as it conflicted with work now.
" As I often have to change some content of a tag in HTML and insert something
" from system clipboard, it's helpful to not insert the old content and
" overwrite system clipboard anymore.
" set clipboard=unnamed

" Use undo file (Persist history through restart)
set undofile
" Directory to use for undo files
set undodir=~/.vimundo

" Custom highlighting
" Highlight whitespace at end of line as error
match Error /\s\+$/
match Todo /TODO\|NOTE/

" Trigger pathogen to autoload plugins
    execute pathogen#infect()
    call pathogen#helptags()

" Include further plugins
    " Add manpage command (:Man) and highlighting!
    runtime! ftplugin/man.vim

" Load further configurations
    " Load general configurations
    runtime! configs/*.vim
    " Load autocommands
    runtime! configs/autocommands/*.vim
    " Load plugin configurations
    runtime! configs/plugins/*.vim
    " Load path specific configuration to override everything else
    runtime! configs/folderspecific/*.vim
    " Load at last, as this are modes like "day" or "present" which will
    " overwrite all existing configuration
    runtime! configs/modes/*.vim

nmap <leader>sp :call <SID>SynStack()<CR>

" Further plugins to use:
" - PHPQA Tools : https://github.com/joonty/vim-phpqa
" - PHPFolding  : https://github.com/rayburgemeestre/phpfolding.vim
" - PHP improved  : https://github.com/StanAngeloff/php.vim
" - project vimrc : https://github.com/joonty/vim-sauce
