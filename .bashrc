# ~/.bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

case "$TERM" in
xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: $PS1"
	;;
*)
	;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\W\$ '
else
    PS1='\W\$ '
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

unset color_prompt force_color_prompt

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export CLICOLOR=1
export TERM=screen-256color

source ~/dotfiles/aliases.sh
