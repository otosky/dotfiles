source ~/.vimrc

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '~/.asdf/shims/python'

" PLUGS
" install vim-plug if not exists
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

source $HOME/.config/nvim/init/plug.vim

source $HOME/.config/nvim/plugin/colors.vim
source $HOME/.config/nvim/plugin/lsp.vim
source $HOME/.config/nvim/plugin/git.vim

