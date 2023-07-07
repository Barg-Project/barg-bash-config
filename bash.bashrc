#
# /etc/bash.bashrc
#

use_color=true


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

if ${use_color} ; then
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1="\e[0;32m╭─ \[\033[01;93m\]Path \[\033[01;37m\]@ \[\033[01;93m\]\w \n\e[0;32m├─ \[\033[01;91m\]Date \[\033[01;37m\]@ \[\033[01;91m\]\d \n\e[0;32m├─ \[\033[01;94m\]Time \[\033[01;37m\]@ \[\033[01;94m\]\A \n\e[0;32m╰─ \[\033[01;92m\]\s \[\033[01;37m\]@ \[\033[01;92m\]\u \[\033[01;37m\]@ \[\033[01;92m\]\H \[\033[01;37m\]| \[\033[01;92m\]+\! # \[\033[01;37m\]: "
	else
		PS1="\e[0;32m╭─ \[\033[01;93m\]Path \[\033[01;37m\]@ \[\033[01;93m\]\w \n\e[0;32m├─ \[\033[01;91m\]Date \[\033[01;37m\]@ \[\033[01;91m\]\d \n\e[0;32m├─ \[\033[01;94m\]Time \[\033[01;37m\]@ \[\033[01;94m\]\A \n\e[0;32m╰─ \[\033[01;92m\]\s \[\033[01;37m\]@ \[\033[01;92m\]\u \[\033[01;37m\]@ \[\033[01;92m\]\H \[\033[01;37m\]| \[\033[01;92m\]+\! $ \[\033[01;37m\]: "
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1="╭─ Path @ \w \n├─ Date @ \d \n├─ Time @ \A \n╰─ \s @ \u @ \H | +\! # : "
	else
		PS1="╭─ Path @ \w \n├─ Date @ \d \n├─ Time @ \A \n╰─ \s @ \u @ \H | +\! $ : "
	fi
fi

unset use_color

alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias more="less"


if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi
