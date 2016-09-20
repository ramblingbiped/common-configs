#!/bin/bash

# Checks that TMUX is installed, if a configuration file is present, and if that configuration file
# has been referenced in .bashrc file.

check_tmux(){
    
    tmux_check=$(dpkg -s tmux | grep -i "status:" | cut -d ' ' -f4)

    if [[ $tmux_check == "installed" ]]
    then
	# Check for pre-existing TMUX config file
	if [[ -f "$HOME/.tmux.conf" ]]
	then
	    /usr/bin/printf("You've already got a TMUX configuration file present.\n\n  Skipping TMUX
	    coniguration installation.\n")
	    exit 1
	else
	    cp tmux.conf $HOME/.tmux.conf
	fi
	# Check for existing entries in .bashrc for TMUX.
	if /bin/grep -i 'tmux' ~/.bashrc > /bin/null 
	then
	    /usr/bin/printf "It looks like you've already got entries in your bashrc configuration
	    file referencing tmux.\n\n Skipping tmux configuration changes to auto-launch tmux on
	    terminal initialization.\n"
	    exit 1
	else
	    # Make necessary entries in .bashrc to initialize TMUX automatically when a terminal is opened.
	    echo "Use sed to insert entry into .bashrc file to initialize tmux on opening of
	    terminal."
	fi
}
