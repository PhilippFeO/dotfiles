# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    PS1='\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1'
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

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
# sources /etc/bash.bash).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ┌─────────────────────────────────────────────────┐
# │ Must be at the end of .bashrc to work properly. │
# └─────────────────────────────────────────────────┘
# Falls Ausgabe doch bissl komisch ist (erste Zeile der Ausgabe ist auch fett): Beitrag lesen und Zeile auskommentieren
# https://stackoverflow.com/questions/3620327/making-entered-commands-bold-at-the-prompt
# trap 'echo -ne "\e[0m"' DEBUG
# Befehlseingabe in neue Zeile, damit man nicht durch lange Verzeichnis an den Rand gedrängt wird
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\033[0;32m$(__git_ps1 " (%s)")\033[0m\n  \$ '

# <up INTEGER> um INTEGER Verzeichnisse hochzuspringen, anstatt cd ../../.. für 3 einfach up 3
up() {
    [ "${1/[^0-9]/}" == "$1" ] && {
        local ups=""
        for i in $(seq 1 $1)
        do
                ups=$ups"../"
        done
        cd $ups
    } || echo "usage: up INTEGER"
}

# <cd DIR; lk> combined
cl() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; lk
    else
        echo "bash: cl: $dir: Directory not found"
    fi
}

bewerbungd() {
    if (( $# != 1 )); then
        echo "Name für tex-Datei fehlt."
    else
        cp ~/Dokumente/Lebenslauf/CV_PhilippRost-de.pdf .
        ln ~/Dokumente/Bewerbungen/BScMathematik_MScInformatik.pdf .
        cp ~/Dokumente/Bewerbungen/templates/de-application-template.tex $1.tex
    fi
}


bewerbung() {
    if (( $# != 1 )); then
        echo "Name für tex-Datei fehlt."
    else
        cp ~/Dokumente/Lebenslauf/CV_PhilippRost.pdf .
        ln ~/Dokumente/Bewerbungen/BScMathematik_MScInformatik.pdf .
        cp ~/Dokumente/Bewerbungen/templates/application-template.tex $1.tex
    fi
}

# ╭──────────────────╮
# │ cht.sh FUNCTIONS │
# ╰──────────────────╯
# function for querying cht.sh (https://github.com/chubin/cheat.sh).
function cs {
    if [ $1 == "-h" ]; then
        echo -e "Usage: cs LANGUAGE QUERY" \
            "\n\n\tQUERY can contain 1...N words separated by spaces." \
            "\n\n\tExamples:" \
        	"\n\t\tcs lua not equals => curl cht.sh/lua/not+equals" \
        	"\n\t\tcs bash for loop => curl cht.sh/bash/for+loop"
    else
        language=$1
        args=${@:2}
        query="cht.sh/"$language"/"$(echo $args | tr ' ' '+')
        echo ">> "$query
        curl $query
    fi
}


alias config-clear='dpkg -l | grep "^rc " | cut -d" " -f3 | xargs dpkg --purge'

#export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
source ~/.config/bash/key-bindings.bash
source ~/.config/bash/completion.bash

export FZF_DEFAULT_OPTS="--color=16 --reverse"
# Modified standard command for fzf. Added by the indentation arguments.
# These are directories I never will visit by command line.
export FZF_DEFAULT_COMMAND="find * -path '*/\.*' -prune \
        -o -path '*Universität*' -prune \
        -o -path '*Bilder*' -prune \
        -o -path '*Musik*' -prune \
        -o -path '*zim_wiki*' -prune \
    -o -type f -print -o -type l -print 2> /dev/null"

# Variables
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

# Repository function
pushall() {
    org_pwd=$(pwd)
    commit_msg="[DLR] Automatic Commit"
    printf '\n'
    for dir in ./wiki ./dotfiles; do
        echo '--- '$dir' ---'
        cd ~/$dir
        git checkout dlr
        git add .
        git commit -m "$commit_msg"
        git push origin dlr
        printf '\n'
    done
    cd $org_pwd
}


# ╭─────────╮
# │ Aliases │
# ╰─────────╯
# Edit corresponding bash_alias files and source it after editing
ba() {
    if [[ "$1" = "n" || "$1" = "nvim" ]]; then 
        nvim ~/dotfiles/.nvim_bash_aliases
    elif [[ "$1" == "g" || "$1" == "git" ]]; then
        n ~/dotfiles/.git_bash_aliases
    fi
    source ~/.bashrc
}

if [ -f ~/dotfiles/.git_bash_aliases ]; then
    . ~/dotfiles/.git_bash_aliases
fi

if [ -f ~/dotfiles/.nvim_bash_aliases ]; then
    . ~/dotfiles/.nvim_bash_aliases
fi

if [ -f ~/.dlr_bash_aliases ]; then
    . ~/.dlr_bash_aliases
fi
