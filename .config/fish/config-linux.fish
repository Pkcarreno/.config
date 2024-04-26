if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

if type -q tmux
    alias ide "~/.scripts/ide"
end

if type -q /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    set -Ux HOMEBREW_NO_AUTO_UPDATE 1
end
