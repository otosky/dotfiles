#! /usr/bin/fish

function install_fisher -d "Install fisher plugin manager."
    if not test -e $HOME/.config/fish/functions/fisher.fish
        echo 'Installing fisher'
        curl -sL https://git.io/fisher | source
    else
        echo 'fisher already installed!'
    end
end
