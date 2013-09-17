PATH=/usr/local/stata12/:"${PATH}"

# Load autojump for directory naviagation in terminal.
. /usr/share/autojump/autojump.sh

# Use this alias to open files with deafualt app from terminal.
alias open='gnome-open'

# List commands
alias l='ls' # list default
alias ld='ls -o | grep ^d' # list only directories (must have the -o)
alias la='ls -A' # list "almost all"
alias ll='ls -oh' # list long (no group info) with human readable size
alias lr='ls -ohR' # ll + list recursively (i.e. subdirectories)

# List content sof path variable using -path- in terminal.
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
