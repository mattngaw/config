function wipe --wraps='clear; fish_greeting' --description 'alias wipe clear; fish_greeting'
  clear; fish_greeting $argv; 
end
