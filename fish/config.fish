########
# Init #
########

starship init fish | source
zoxide init fish | source
thefuck --alias | source 
source /Users/matto/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

#########################
# Environment Variables #
#########################

# Setting PATH for Python 3.10
# The original version is saved in /Users/matto/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

set -x PATH "/Users/matto/.opam/default/bin/ocamlmerlin" "$PATH"
set -x PATH "/Users/matto/.cargo/bin/rust-analyzer" "$PATH"

set -x PATH "/Users/matto/tools/sv2v" "$PATH"

set -gx TODO "/Users/matto/Library/Mobile Documents/iCloud~md~obsidian/Documents/matto/vita/todo.md"
set -gx CONFIG "/Users/matto/.config/fish/config.fish"
set -gx ICLOUD "/Users/matto/Library/Mobile\ Documents/com~apple~CloudDocs/"


###########
# ALIASES #
###########

alias ls "exa"
alias cat "bat"
alias vim "nvim"
alias wipe "clear; fish_greeting_mini"
alias todo "nvim \"$TODO\""
alias today "icalBuddy -f -npn -nc -ps \"/ @ /\" -eep \"url\" -ec \"Ev's Classes\",\"OH\" eventsToday"
