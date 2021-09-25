let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin("~/.config/nvim/plugged")
  Plug 'junegunn/fzf'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdcommenter'
call plug#end()

filetype plugin on
" theme
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme gruvbox

nnoremap L $
nnoremap H ^
nnoremap <C-n> :nohl <CR>

tnoremap <Esc> <C-\><C-n>


set relativenumber
set autoindent
set expandtab
set tabstop=2 shiftwidth=2
set smarttab
set backspace=indent,eol,start

"remove handicaps
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
