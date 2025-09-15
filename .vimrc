set nocompatible " no vi compatible syntax
syntax enable

let mapleader = "\<Space>" " Set space as leader

set clipboard=unnamedplus
set expandtab " insert spaces when tab is pressed
set tabstop=2 softtabstop=2 " number of spaces inserted when tab key pressed
set shiftwidth=2 " number of spaces inserted by < & > indent motions
set smartindent " try to indent
set number " number lines
set incsearch " incremental search
set cursorline " highlight current line
set lazyredraw    " redraw only when we need to.
set scrolloff=5 " show lines above and below cursor (when possible)
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set hidden " allow buffer to be hiden if modified
set splitbelow
set noswapfile
set nobackup
set splitright
" smart case sensitive search
set smartcase
set ignorecase
" undo persist
set undodir=~/.vim/undodir
set undofile

" Highlight search toggle
set hlsearch

set colorcolumn=90
highlight ColorColumn ctermbg=black

filetype indent on " load filetype-specific indent files

map ; :

nnoremap <C-J> :bp <CR>
nnoremap <C-K> :bn <CR>

noremap <leader>f <C-W>w
nnoremap <leader>\ :nohlsearch<CR> " Disable until next search
