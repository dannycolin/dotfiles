"""""""""""""""""""""""""""
" vim configuration file  "
"                         "
" 0. General Settings     "
" 1. Plugins              "
" 2. Key Mapping          "
" 3. Status line          "
" 4. Syntax Hightlighting "
"                         "
"""""""""""""""""""""""""""

"""""""""""""""""""""""
" 0. General Settings "
"""""""""""""""""""""""

set clipboard=unnamedplus " Always use CLIPBOARD
set laststatus=2          " Always show statusline
set mouse=                " NO MOUSE VIM !!!
set colorcolumn=81        " Highlight 81th column
filetype plugin on        " set config specific to filetype

" Files
set encoding=utf-8        " the encoding displayed
set fileencoding=utf-8    " the encoding written to file
set hidden                " allow changing buffer even when modified
set noswapfile            " turn off swapfile
set nobackup              " turn off backup file
set showmatch             " hightlight matching bracket ({[
set undofile              " Keep an history of undo
