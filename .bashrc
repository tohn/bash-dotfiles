# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
#export HISTCONTROL=ignoreboth

# one history for all
# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" # standard
# PS1="\d \A, \# commands, \j jobs, tty #\l\n\u@\H:\w \$ "
# PS1="\[\e[0;32;40m\u@\h:\w\$\e[0m\]"
# PS1='\[\033[0;32;40m\]\u@\H:\e[0m ' # bsp 1 (wiki.uu.de/Bash/Prompt)
# PS1='\[\033[1;34;40m[\033[1;31;40m\u@\h:\w\033[1;34;40m]\033[1;37;40m $\033[0;37;0m\] ' # bsp 2
# PS1='\s\v \[\e[31m\]User \[\e[34m\]\u \[\e[31m\]on host \[\e[34m\]\h\[\e[31m\] in dir \[\e[34m\]\w\n\d \t> \[\e[37m\] ' # bsp 3
# PS1='\[\033[1;73m\][`date +%H:%M:%S`]\[\033[1;36m\][\[\033[1;34m\]\u\[\033[1;33m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;36m\]]\[\033[1;31m\]\\$\[\033[0m\] ' # bsp 4
# PS1='[\[\033[1;34m\]\u\[\033[1;33m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;36m\]]\[\033[1;31m\]\\$\[\033[0m\] ' # bsp 4
# PS1='`history -w`\[\033[0;31m\]\t | \h\n\[\033[0;34m\]\w \$ \[\033[0m\]'
#PS1='`history -w`\[\033[1;31m\]<\[\033[1;30m\]<\[\033[1;31m\]< \[\033[0;31m\]\t | \h\n\[\033[1;32m\]>\[\033[1;30m\]>\[\033[1;32m\]> \[\033[0;34m\]\w \$ \[\033[0m\]'
PS1='\[\033[1;31m\]<\[\033[1;30m\]<\[\033[1;31m\]< \[\033[0;31m\]\t | \h\n\[\033[1;32m\]>\[\033[1;30m\]>\[\033[1;32m\]> \[\033[0;34m\]\w \$ \[\033[0m\]'
#PS1='\033[01;31m$(returncode)\033[00m\n\033[01;31m<\033[00m \h \033[01;31m|\033[00m \u \033[01;31m|\033[00m \w \033[01;31m>\033[00m\n    \$ '
    ;;
*)
    ;;
esac

export PS1='\[\033[1;31m\]<\[\033[1;30m\]<\[\033[1;31m\]< \[\033[0;31m\]\t | \h\n\[\033[1;32m\]>\[\033[1;30m\]>\[\033[1;32m\]> \[\033[0;34m\]\w \$ \[\033[0m\]'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f .bash_aliases ]; then
    . .bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#unset $PS1
#export $PS1="[\d \A, Bash Version \V, \# Commands, \j Jobs, tty #\l]\n[\u@\H:\w] \$"

# dient zur verschluesselung
export GPG_TTY='tty'

# ManPages mit Farbe versehen / bzw. less
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[0;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[0m'

# bei sudo auch tab-completion benutzen..
complete -cf sudo

# WMII - Stuff (http://wiki.archlinux.org/index.php/Wmii)
WMII_IS_RUNNING=`ps a | grep wmii | awk '/[^"grep"] wmii$/'`
if [ -n "$WMII_IS_RUNNING" ]; then
  PROMPT_COMMAND='dirs | wmiir write /client/sel/label'
fi

# Exports
export EDITOR=vim
export VISUAL=vim
export BROWSER=/usr/bin/firefox
export PATH=${PATH}:/opt:/usr/lib:/home/${USER}/bin/

# xdg
#export XDG_DATA_HOME=/home/${USER}/.data
#export XDG_CONFIG_HOME=/home/${USER}/.config
#export XDG_CACHE_HOME=/home/${USER}/.cache

# colors
. .bash_colors

# functions
. .bash_functions

#CDPATH='.:..:../..:~'

# bc zeilenumbruch verhindern (http://www.onli-blogging.de/index.php?/881/bc-und-Zeilenlaenge.html)
export BC_LINE_LENGTH=0

# volume
#if [ -e /tmp/.volume ] ; then
#	sleep 0
#else
#	touch /tmp/.volume
#	amixer set Headphone 80% > /dev/null
#	amixer set Speaker 60% > /dev/null
#fi

# von http://www.deesaster.org/blog/index.php?/archives/1513
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
