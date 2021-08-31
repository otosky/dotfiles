call plug#begin("~/.config/nvim/plugged")
  Plug 'junegunn/fzf'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf.vim'
call plug#end()

" theme
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme gruvbox

set relativenumber
set autoindent
set expandtab
set tabstop=2 shiftwidth=2
set smarttab
set backspace=indent,eol,start
