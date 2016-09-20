#!/bin/bash

# Check if config files exist, back them up if they do by adding the ".old" suffix, and move new config files into the home
# directory.
for file in vimrc tmux.conf
do
    if [ -f ~/.$file ]
    then
	/bin/echo "Backing up existing $file configuration files..."
	/bin/mv ~/.$file ~/.$file.old
	/bin/cp $file ~/.$file
    else
	/bin/cp $file ~/.$file
    fi
done
