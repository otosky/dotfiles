if not test -e $HOME/.config/fish/functions/fisher.fish
  echo 'Installing fisher'
  curl -sL https://git.io/fisher | source 
  fisher update
end

set -gx fish_key_bindings fish_vi_key_bindings
set -gx fish_greeting
set -gx POETRY_VIRTUALENVS_IN_PROJECT 'true'
set -gx DIRENV_LOG_FORMAT ''

# interactive things
status is-interactive || exit

fish_add_path $HOME/bin/
source ~/.asdf/asdf.fish
direnv hook fish | source

set -gx EDITOR (which nvim)
