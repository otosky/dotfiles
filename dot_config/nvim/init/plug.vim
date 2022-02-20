call plug#begin("~/.config/nvim/plugged")
  
  "Theme
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  
  "File Nav & Search
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  
  "Helpful editing commands
  "Plug 'preservim/nerdcommenter'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'windwp/nvim-autopairs'
  Plug 'Vimjas/vim-python-pep8-indent'
  
  "Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'


  "LSP & Autocomplete
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'mattn/efm-langserver'

call plug#end()
filetype plugin on
filetype indent on

lua << EOF
  require('nvim-autopairs').setup{}
  require('lualine').setup {
    options = { theme = 'gruvbox' }
    }
EOF
