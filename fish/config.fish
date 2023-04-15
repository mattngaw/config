if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias icloud "cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

alias home "cd ~"
alias wipe "clear; fish_greeting"
alias ls "exa"
alias cat "bat"
alias vim "nvim"
alias todos "nvim ~/dotfiles/.todo"
alias todo "bat ~/dotfiles/.todo"

starship init fish | source
zoxide init fish | source

thefuck --alias | source 

# Setting PATH for Python 3.10
# The original version is saved in /Users/matto/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

