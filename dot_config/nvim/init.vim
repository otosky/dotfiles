syntax on


let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" PLUGS
" install vim-plug if not exists
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.config/nvim/plugged")
  Plug 'neovim/nvim-lspconfig'
"  Plug 'itchyny/lightline.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
call plug#end()
filetype plugin on

" theme
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
colorscheme gruvbox

" remaps
let mapleader = "'"
inoremap <C-L> <Esc>
nnoremap <C-n> :nohl <CR>
nnoremap L $
nnoremap H ^
nnoremap dH d^
tnoremap <Esc> <C-\><C-n>

" editor settings
set number
set relativenumber
set autoindent
set expandtab
set tabstop=2 shiftwidth=2
set smarttab
set backspace=indent,eol,start
set hlsearch
set incsearch
set colorcolumn=100
set nowrap
set laststatus=2

" LSP-related
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

"remove handicaps
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap! <Up> <nop>
noremap! <Down> <nop>
noremap! <Left> <nop>
noremap! <Right> <nop>
