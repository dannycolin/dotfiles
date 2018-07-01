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

packadd! airline.vim
packadd! emmet.vim
packadd! fugitive.vim
packadd! gitgutter.vim
packadd! nerdtree.vim
packadd! onedark.vim
packadd! twig.vim

"""""""""""""""
" Airline.vim "
"""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""
" Emmet.vim "
"""""""""""""

let g:user_emmet_expandabbr_key = '<C-e>'

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

" Show netrw
nnoremap <C-\> :NERDTreeToggle<CR>
" Go to previous buffer and close the last one
nnoremap <C-w>c :bp\|bd #<CR>

" Switch buffers 
"   Prevent opening the file in NerdTree by moving the cursor to the next
"   buffer before switching to the next/prev buffer.
nnoremap <silent> <expr> <Tab> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":bn\<CR>"
nnoremap <silent> <expr> <S-Tab> (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '').":bp\<CR>"

" remap shift+: to space
nnoremap <space> :

""""""""""""""""""""""""""
" 3. Syntax highlighting "
""""""""""""""""""""""""""

syntax on                 " turn on syntax highlighting
colorscheme onedark       " set the colorscheme

