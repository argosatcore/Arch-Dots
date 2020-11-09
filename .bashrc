# _____ _            ____                              
#|_   _| |__   ___  | __ )  ___  _   _ _ __ _ __   ___ 
#  | | | '_ \ / _ \ |  _ \ / _ \| | | | '__| '_ \ / _ \
#  | | | | | |  __/ | |_) | (_) | |_| | |  | | | |  __/
#  |_| |_| |_|\___| |____/ \___/ \__,_|_|  |_| |_|\___|
#                                                      
#    _               _         ____  _          _ _   
#   / \   __ _  __ _(_)_ __   / ___|| |__   ___| | |  
#  / _ \ / _` |/ _` | | '_ \  \___ \| '_ \ / _ \ | |  
# / ___ \ (_| | (_| | | | | |  ___) | | | |  __/ | |_ 
#/_/   \_\__, |\__,_|_|_| |_| |____/|_| |_|\___|_|_(_)
#        |___/                                        

#Environmental Variables:
	export EDITOR="nvim"
	export PAGER="less"
	export MANPAGER='nvim +Man!'
	export BROWSER="firefox"
	export TERM="xterm-256color"
	bind 'set completion-ignore-case on'
	shopt -s cdspell
	shopt -s autocd
	complete -d cd

#Aliases:
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'
	alias c='clear'
	alias suspend='systemctl suspend'
	alias v='nvim'
	alias x='startx'
	alias t='tmux'
	alias n='nnn'
	alias screencast='ffmpeg -f x11grab -r 50 -s 1366x768 -i :0.0 -acodec aac -vcodec libx264 -crf 0 screencast.mkv'
	alias sec='xmodmap /home/carlos/.speedswapper'
	alias rxterm='xrdb -merge .Xresources'



# If not running interactively, don't do anything
	case $- in
	    *i*) ;;
	      *) return;;
	esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
	HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
	shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
	HISTSIZE=1000
	HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
	shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
	[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
	case "$TERM" in
	    xterm-color|*-256color) color_prompt=yes;;
	esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

		PS1='\[\033[01;97m\]['; 
		PS1+='\[\033[01;91m\]\w';
		PS1+='\[\033[01;97m\]]';
		PS1+='\[\033[00;96m\]⋏ ';
		PS1+='\[\033[00;00m\]';

# enable color support of ls and also add handy aliases
	if [ -x /usr/bin/dircolors ]; then
	    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	    alias ls='ls --color=auto'
	    alias dir='dir --color=auto'
	    alias vdir='vdir --color=auto'
	
	    alias grep='grep --color=auto'
	    alias fgrep='fgrep --color=auto'
	    alias egrep='egrep --color=auto'
	fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

	if [ -f ~/.bash_aliases ]; then
    	. ~/.bash_aliases
	fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
	if ! shopt -oq posix; then
	  if [ -f /usr/share/bash-completion/bash_completion ]; then
	    . /usr/share/bash-completion/bash_completion
	  elif [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
	  fi
	fi

#Custom aliases:

	# Pull up vim's .vimrc:
	alias vrc='nvim /home/argos/.vimrc'

	# Pull up bash's .bashrc:
	alias brc='nvim /home/argos/.bashrc'

	# Use Nvim:
	alias v='nvim'

	# Transform terminal into a launcher:
	alias f='xdg-open $(fzf); exit'

	#Tmux:
	alias t='tmux'

	#Watch sensors
	alias ws='watch sensors'

	#Htop
	alias ht='htop'

	#NNN:
	alias n='nnn'
	
	#Clear Terminal:
	alias c='clear'

	#Fetch updates:
	alias aptdate='sudo apt update'

	#Show upgradable packages:
	alias aptgradable='apt list --upgradable'

	#Upgrade packages:
	alias aptgrade='sudo apt upgrade'

	#Search for a package:
	alias lookapt='apt search'


# Vim mode:
	set -o vi 
	bind 'set show-mode-in-prompt on'
	bind 'set vi-ins-mode-string +'
	bind 'set vi-cmd-mode-string -'

# Turn off bell
	set bell-style none


# NNN's environmental variables:

	#Bookmarks:
#	export NNN_BMS='t:/home/carlos/Desktop/Proyecto Final de Graduación Arquitectura/;p:/home/argos/Desktop/Proyectos Personales/;d:/home/argos/Downloads/;i:/home/argos/Pictures/'

	#Plugins:
	export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:dragdrop;t:nmount;v:preview-tui;z:fzcd'
	
	#Archive:
	export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
	
	#Trash:
	export NNN_TRASH=1

