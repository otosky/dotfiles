if not test -e $HOME/.config/fish/functions/fisher.fish
  echo 'Installing fisher'
  curl -sL https://git.io/fisher | source 
end

set -U fish_key_bindings fish_vi_key_bindings

# interactive things
status is-interactive || exit

set -U fish_greeting
