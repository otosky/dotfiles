if status is-interactive
    # Commands to run in interactive sessions can go here
end

if not test -e $HOME/.config/fish/functions/fisher.fish
  echo 'Installing fisher'
  curl -sL https://git.io/fisher | source 
end

starship init fish | source
