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

set nocompatible          " Stop living in the past
set clipboard=unnamedplus " Always use CLIPBOARD
set laststatus=2          " Always show statusline
set mouse=                " NO MOUSE VIM !!!
set colorcolumn=81        " Highlight 81th column
set showcmd               " Show current command
set shortmess-=S          " Show count when searching with `/`
filetype plugin on        " set config specific to filetype

" Modeline
" Turn it off to prevent Arbitrary Code Execution via Modelines
" CVE-2019-12735
set modelines=0
set nomodeline

" Files
set encoding=utf-8        " the encoding displayed
set fileencoding=utf-8    " the encoding written to file
set hidden                " allow changing buffer even when modified
set noswapfile            " turn off swapfile
set nobackup              " turn off backup file
set showmatch             " hightlight matching bracket ({[
set undofile              " Keep an history of undo

" Fuzzy finder
set path+=**
set wildmenu

" Line number
" Show relative line number from current line
" but still show the current line number
set number
set relativenumber

" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

" Use 24-bit (true-color) if available
if (has("termguicolors"))
  set termguicolors
endif

" Autosave (default based on updatetime so every 4000ms)
"
" ***Move autocmd to a separate plugin***
"
" Values :
"   InsertLeave
"   TextChanged, TextChangedI (depends on updatetime)
"   CursorHold, CursorHoldI (depends on updatetime)
autocmd CursorHold,CursorHoldI * if expand('%') != '' | silent update | endif

" Remove white space on save
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""
" 1. Plugins  "
"""""""""""""""

""""""""""""""""
" Load plugins "
""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'Mofiqul/adwaita.nvim'
Plug 'mattn/emmet-vim', { 'for': ['css', 'html', 'markdown'] }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'

call plug#end()

"""""""""""
" Builtin "
"""""""""""

" enable syntax highlight of fenced code blocks in Markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'html', 'javascript', 'python']

"""""""""""""
" Emmet.vim "
"""""""""""""

let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_install_global = 0
autocmd FileType html,markdown EmmetInstall

""""""""""""""""
" Nerdtree.vim "
""""""""""""""""

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
autocmd FileType nerdtree setlocal relativenumber

""""""""""""""""""
" 2. Key mapping "
""""""""""""""""""

" Show netrw
nnoremap <C-\> :NERDTreeToggle<CR>

" Switch buffers
"   Prevent opening the file in NerdTree by moving the cursor to the next
"   buffer before switching to the next/prev buffer.
nnoremap <silent> <expr> <C-n> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":bn\<CR>"
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":bp\<CR>"

" Close buffer
nnoremap <C-w>c :bp\|bd #<CR>

function CycleBuffers()

endfunction

" auto-close brackets
" TODO:
" - How can I automagically don't auto-close for comments?
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Auto expand bracket blocks
inoremap <expr> <CR> AutoExpandBlock()

function AutoExpandBlock()
  if search('{\%#}') || search('\[\%#\]')
    return "\<CR>\<CR>\<Up>\<C-f>"
  else
    return "\<CR>"
endfunction

"""""""""""""""""
" 3. Statusline "
"""""""""""""""""

set statusline=%f%h%m%r%=%y[%c:%l/%L]

""""""""""""""""""""""""""
" 4. Syntax highlighting "
""""""""""""""""""""""""""

colorscheme adwaita                 " set the colorscheme
syntax on                           " turn on syntax highlighting

" override theme's colors
highlight ColorColumn ctermbg=238 guibg=#3B4048

