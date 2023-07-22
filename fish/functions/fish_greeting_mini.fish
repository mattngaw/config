function fish_greeting_mini
	set hn (hostname -s)
	set un (whoami)
	set date (date "+%A, %b %d")

    set schedule (icalBuddy -f -npn -nc -ps "/ @ /" -eep "url" -ec "Ev's Classes","Landscape","OH" eventsToday)

	# Output it to the console
	printf (set_color -o white)"Date: "
	printf (set_color normal)(set_color 888888)"%s\n" $date

	printf (set_color -o white)"Hostname: "
	printf (set_color normal)(set_color cyan)"%s\n" $hn
	printf (set_color -o white)"User: "
	printf (set_color normal)(set_color blue)"%s\n" $un
	printf "\n"
    printf (set_color -o white)"Today's Schedule:\n"
    set_color normal
    if [ "$schedule" = "" ]
        printf "Nothing!\n"
    else
        printf "%s\n" $schedule
    end
    printf "\n"
    printf (set_color -o white)"TODOs:\n"(set_color normal)
	while read line; printf "%s\n" $line; end < "/Users/matto/Library/Mobile Documents/iCloud~md~obsidian/Documents/matto/vita/todo.md"
	printf "\n"

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
