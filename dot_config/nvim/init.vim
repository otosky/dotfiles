source ~/.vimrc

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" PLUGS
" install vim-plug if not exists
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.config/nvim/plugged")
  Plug 'neovim/nvim-lspconfig'
  Plug 'vim-airline/vim-airline'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
call plug#end()
filetype plugin on

" theme
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
colorscheme gruvbox

" LSP-related
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.hls.setup{}
EOF
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

"gitgutter
set updatetime=100
