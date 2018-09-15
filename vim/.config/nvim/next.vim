"""""""""""""""""""""""""""
" vim configuration file  "
"                         "
" 0. General Settings     "
" 1. Plugins              "
" 2. Key Mapping          "
" 3. Syntax Hightlighting "
"                         "
"""""""""""""""""""""""""""

"""""""""""""""""""""""
" 0. General Settings "
"""""""""""""""""""""""

set nocompatible            " turn off compatibility with vi
set clipboard+=unnamedplus  " Always use CLIPBOARD
set encoding=utf-8          " the encoding displayed
set fileencoding=utf-8      " the encoding written to file
set mouse=                  " NO MOUSE VIM !!!
set number                  " show linenumbers
set noswapfile              " turn off swapfile
set hidden

" Indentation
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

filetype plugin on          " set config specific to filetype

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" Without that the background color is wrong.
if (has("termguicolors"))
  set termguicolors
endif

" Show vim highlighting group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"""""""""""""""
" 1. Plugins  "
"""""""""""""""

""""""""""""""""
" Load plugins "
""""""""""""""""

packadd! buftabline.vim   " rewrite my own version? At least statusline.vim.
packadd! nerdtree.vim     " Use :Lexplore instead
packadd! onedark.vim      " Check how to split language in their own file
                          " and create a photon.vim 
packadd! emmet.vim        " Load it only for html, css file

""""""""""""""""""
" Buftabline.vim "
""""""""""""""""""

let g:buftabline_indicators = 1

""""""""""""""""
" Nerdtree.vim "
""""""""""""""""

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""""""""""""""""""
" 2. Key mapping "
""""""""""""""""""

" Show NERDTree 
nnoremap <C-\> :NERDTreeToggle<CR>

" Go to previous buffer and close the last one
nnoremap <C-w>c :bp\|bd #<CR>

" Switch buffers 
"   Prevent opening the file in NerdTree by moving the cursor to the next
"   buffer before switching to the next/prev buffer.
nnoremap <silent> <expr> <C-n> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":bn\<CR>"
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":bp\<CR>"

" remap shift+: to space
nnoremap <space> :

" Autoclose 
inoremap <<TAB> <><ESC>ha
inoremap (<TAB> ()<ESC>ha
inoremap [<TAB> []<ESC>ha
inoremap {<TAB> {}<ESC>ha

"""""""""""""""""
" 3. Statusline "
"""""""""""""""""

set laststatus=2
set statusline=
set statusline+=%f
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=%y
set statusline+=[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=[%{&fileformat}]
set statusline+=\ %l
set statusline+=/%L
set statusline+=:
set statusline+=%c

""""""""""""""""""""""""""
" 3. Syntax highlighting "
""""""""""""""""""""""""""

syntax on                 " turn on syntax highlighting
colorscheme onedark       " set the colorscheme

