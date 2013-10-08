PATH=/usr/local/stata12/:"${PATH}"
#PATH=/usr/lib/ruby/1.9.1:"${PATH}"

# Load autojump for directory naviagation in terminal.
. /usr/share/autojump/autojump.sh

# Open files with deafualt app from terminal.
alias open='gnome-open'

# List commands
alias l='ls' # list default
alias ld='ls -o | grep ^d' # list only directories (must have the -o)
alias la='ls -A' # list "almost all"
alias ll='ls -oh' # list long (no group info) with human readable size
alias lr='ls -ohR' # ll + list recursively (i.e. subdirectories)

# Github-pages gem for blooging with Jekyll
alias bjs='bundle exec jekyll serve' # to build github blog locally
alias buj='bundle update' # updates jekyll
alias bug='bundle update github-pages' # updates whole hithub gem

# List 10 most used commands in terminal
alias hist='history | awk '\''{print $2};'\'' | sort | uniq -c | sort -rn | head -10'

# List contents of path variable using -path- in terminal.
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

# Alias for app
alias rescuetime='rescuetime_linux_uploader'

# Set window size for terminal
#Must have xterm package installed (use synaptic)
#resize -s 48 80
#change the default size in the Edit --> preferences menu. It's better.


# qfind - used to quickly find files that contain a string in a directory
# Credit: http://blog.smalleycreative.com/linux/tip-easily-find-files-within-the-current-directory/
qfind () {
    find . -exec grep -l $1 {} \;
    return 0
}


#---------------------- Set correct colors for terminal -----------------------

# This sets $TERM and other variables to the "correct" values. Otherwise,
# many apps think the terminal supports only 8 colors, when in fact it 
# supports 256.

# Code from http://vim.wikia.com/wiki/256_colors_in_vim

# Catch gnome-terminal and automatically set the TERM correctly for xterm:

if [ "$TERM" = "xterm" ] ; then
    if [ -z "$COLORTERM" ] ; then
        if [ -z "$XTERM_VERSION" ] ; then
            echo "Warning: Terminal wrongly calling itself 'xterm'."
        else
            case "$XTERM_VERSION" in
            "XTerm(256)") TERM="xterm-256color" ;;
            "XTerm(88)") TERM="xterm-88color" ;;
            "XTerm") ;;
            *)
                echo "Warning: Unrecognized XTERM_VERSION: $XTERM_VERSION"
                ;;
            esac
        fi
    else
        case "$COLORTERM" in
            gnome-terminal)
                # Those crafty Gnome folks require you to check COLORTERM,
                # but don't allow you to just *favor* the setting over TERM.
                # Instead you need to compare it and perform some guesses
                # based upon the value. This is, perhaps, too simplistic.
                TERM="gnome-256color"
                ;;
            *)
                echo "Warning: Unrecognized COLORTERM: $COLORTERM"
                ;;
        esac
    fi
fi

# Provide additional logic to make sure it falls back if there are missing 
# Terminfo files:

SCREEN_COLORS="`tput colors`"
if [ -z "$SCREEN_COLORS" ] ; then
    case "$TERM" in
        screen-*color-bce)
            echo "Unknown terminal $TERM. Falling back to 'screen-bce'."
            export TERM=screen-bce
            ;;
        *-88color)
            echo "Unknown terminal $TERM. Falling back to 'xterm-88color'."
            export TERM=xterm-88color
            ;;
        *-256color)
            echo "Unknown terminal $TERM. Falling back to 'xterm-256color'."
            export TERM=xterm-256color
            ;;
    esac
    SCREEN_COLORS=`tput colors`
fi
if [ -z "$SCREEN_COLORS" ] ; then
    case "$TERM" in
        gnome*|xterm*|konsole*|aterm|[Ee]term)
            echo "Unknown terminal $TERM. Falling back to 'xterm'."
            export TERM=xterm
            ;;
        rxvt*)
            echo "Unknown terminal $TERM. Falling back to 'rxvt'."
            export TERM=rxvt
            ;;
        screen*)
            echo "Unknown terminal $TERM. Falling back to 'screen'."
            export TERM=screen
            ;;
    esac
    SCREEN_COLORS=`tput colors`
fi

#-------------------- Check all Git repos in home directory -------------------

# Check repos to see which are not updated.

function gitcheck() {
	## gitcheck:
	##   Check all git repositories in subdirectories, and list the ones with changes
	##   30/07/2011, AstroFloyd, bzrcheck
	##   18/01/2013, Astrofloyd, gitcheck
	##   08/10/2013, Roberto Ferrer, slightly modified and wrapped in a function.
        
	# Save current working directory
	cwd=$(pwd)

	# Change to home directory
	cd 

	# Initialise counters:
	let count_all=0
	let count_changed=0
	let count_unchanged=0

	# Set to 1 for more verbose output:
	#let verbose=$1

	# Find git repos and loop over them: (exclude .local dir that has some trash and .vim/bundle that uses Git on its own.)
	#for repo in `find . -type d -name ".git" -not -path "./.local/*"`
	for repo in `find . -not \( -path "./.local/*" -prune \) -not \( -path "./.vim/bundle/*" -prune \) -type d -name ".git" `
	do
	    let count_all=${count_all}+1
	    
	    # cd to the dir that contains .git/:
	    dir=`echo ${repo} | sed -e 's/\/.git/\//'`
	    cd ${dir}
	    
	    # If there are changes, print some status and branch info of this repo:
	    git status -s | grep -v '??' &> /dev/null && {
		echo -e "\n \E[1;31m ${dir}\E[0m"
		git branch -vvra
		git status -s | grep -v '??'
		let count_changed=${count_changed}+1
	    }
	    
	    # If verbose, print info in the case of no changes:
	    git status -s | grep -v '??' &> /dev/null || {
		if [ "$1" == "-v" ]; then echo -e "\nNothing to do for ${dir}"; fi
		let count_unchanged=${count_unchanged}+1
	    }
	    
	    # cd back:
	    cd - &> /dev/null
	done

	# Report status and exit:
	echo -ne "\n\n${count_all} git repositories found: "
	echo -ne "${count_changed} have changes, "
	echo -ne "${count_unchanged} are unchanged.\n\n"

	# Change back to original working directory
	cd ${cwd}
}
