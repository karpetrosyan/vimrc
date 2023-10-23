set relativenumber
set backspace=indent,eol,start
set background=dark

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'github/copilot.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'

call plug#end()

colorscheme gruvbox
