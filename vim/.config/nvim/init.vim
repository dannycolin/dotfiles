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
set t_Co=255                " 256-colors terminal 
set encoding=utf-8          " the encoding displayed
set fileencoding=utf-8      " the encoding written to file
set number                  " show linenumbers
set relativenumber          " show linenumners relative to current position
set noswapfile              " turn off swapfile
set clipboard=unnamed       " use system clipboard
set expandtab               " Expand TABs to spaces
set tabstop=4               " The width of a TAB is set to 4
set shiftwidth=4            " Indents will have a width of 4
set softtabstop=4           " Set the number of columns for a TAB
set clipboard+=unnamedplus  " Always use CLIPBOARD
set mouse=                  " NO MOUSE VIM !!!

filetype plugin on          " set config specific to filetype

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

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
packadd! goyo.vim

"""""""""""""""
" Airline.vim "
"""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1

"""""""""""""
" Emmet.vim "
"""""""""""""

let g:user_emmet_expandabbr_key = '<C-e>'

""""""""""""""""
" NerdTree.vim "
""""""""""""""""

let NERDTreeShowHidden=1
let NERDTreeWinSize=30

""""""""""""
" Goyo.vim "
"""""""""""" 

function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  set tw=80
  set linebreak
  " ...
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=5
  set tw=0
  set nolinebreak
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()j

""""""""""""""""""
" 2. Key mapping "
""""""""""""""""""

" All modes

" toggle on/off treeview
noremap <C-n> :NERDTreeToggle<CR>

" Normal mode

" Toggle on Goyo
nnoremap <C-g> :Goyo<CR>

" create new buffer
nnoremap <C-w>b :enew<CR>

" Go to previous buffer and close the last one
nnoremap <C-w>c :bp\|bd #<CR>

" Switch buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" remap shift+: to space
nnoremap <space> :

""""""""""""""""""""""""""
" 3. Syntax highlighting "
""""""""""""""""""""""""""

syntax on                 " turn on syntax highlighting
colorscheme onedark       " set vim colorscheme theme
