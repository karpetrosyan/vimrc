set relativenumber
set backspace=indent,eol,start
set background=dark

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter' # git diff
Plug 'tpope/vim-fugitive' # git commands
Plug 'morhetz/gruvbox' # colorscheme
Plug 'github/copilot.vim' # github copilot

call plug#end()

colorscheme gruvbox

