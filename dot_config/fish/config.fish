if not test -e $HOME/.config/fish/functions/fisher.fish
  echo 'Installing fisher'
  curl -sL https://git.io/fisher | source 
end

set -U fish_key_bindings fish_vi_key_bindings
set -U fish_greeting

# interactive things
status is-interactive || exit

direnv hook fish | source
