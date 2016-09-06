#!/bin/bash

check_tmux(){
  

	if [[ -f "$HOME/.tmux.conf" ]]
	then
	  /usr/bin/printf("You've already got a TMUX configuration file present.")
	  exit 1
	else
	  cp .tmux.conf $HOME
	fi

	if /bin/grep -i 'tmux' ~/.bashrc > /bin/null 
	then
	  /usr/bin/printf("It looks like you've already got entries in your bashrc configuration file referencing tmux.")
	  exit 1
	else
	  $tmux-bashrc
	fi
