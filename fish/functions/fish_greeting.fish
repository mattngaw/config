function fish_greeting
    if not set -q fish_greeting
    	# Greeting messages
	set powered_msgs \
		# "You have power over your mind - not outside events. 
# Realize this, and you will find strength."\
		# "How does it help...
# to make troubles heavier by bemoaning them?"\
		"Those who have a 'why' to live, can bear with almost any 'how'."\
		"One must imagine Sisyphus happy."\
		"Memento mori"\
        "I am meant to do great things."\
        "Throughout Heaven and Earth, I alone am the Honored One."\
        "Be tolerant with others and strict with yourself."
	# Randomly pick a message
	set chosen_msg (random)"%"(count $powered_msgs)
	set chosen_msg $powered_msgs[(math $chosen_msg"+1")]

	set hn (hostname -s)
	set un (whoami)
	set date (date "+%A, %b %d")
    set art (cat ~/.config/fish/functions/art.txt)

    set schedule (icalBuddy -f -eep "url,notes,location,attendees" -ec "Ev's Classes","Landscape","OH" eventsToday)

	# Output it to the console
	printf (set_color -o white)"Date: "
	printf (set_color normal)(set_color 888888)"%s\n" $date

	printf (set_color -o white)"Hostname: "
	printf (set_color normal)(set_color cyan)"%s\n" $hn
	printf (set_color -o white)"User: "
	printf (set_color normal)(set_color blue)"%s\n" $un
	printf "\n"
    printf (set_color -o white)"%s\n" $art
    printf "\n"
	printf (set_color normal)(set_color blue)"%s\n" $chosen_msg
	printf "\n"
    printf (set_color -o white)"Today's Schedule:\n"
    set_color normal
    if [ "$schedule" = "" ]
        printf "Nothing!\n"
    else
        printf "%s\n" $schedule
    end
    printf (set_color normal)"\n"
    printf (set_color -o white)"TODOs:\n"(set_color normal)
	while read line; printf "%s\n" $line; end < "/Users/matto/Library/Mobile Documents/iCloud~md~obsidian/Documents/matto/vita/todo.md"
	printf "\n"

    end

    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    test -n "$fish_greeting"
    and echo $fish_greeting\n
end
