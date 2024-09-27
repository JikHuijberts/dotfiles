if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias get_esprs='. $HOME/export-esp.sh'

function fish_greeting
    cat ~/.config/fish/hello.txt
end

starship init fish | source
