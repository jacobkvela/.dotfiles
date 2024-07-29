# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# used by various programs to determine default editors
export EDITOR=vim
export VISUAL=vim

# rust add to path 
. "$HOME/.cargo/env"

# compression function
compress() {
FILE=$1
shift
case $FILE in
*.tar.bz2) tar cjf $FILE $*  ;;
*.tar.gz)  tar czf $FILE $*  ;;
*.tgz)     tar czf $FILE $*  ;;
*.zip)     zip $FILE $*      ;;
*.rar)     rar $FILE $*      ;;
*)         echo "Filetype not recognized" ;;
esac
}


# extract function
extract () {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2)   tar xjf $1     ;;
*.tar.gz)    tar xzf $1     ;;
*.bz2)       bunzip2 $1     ;;
*.rar)       unrar e $1     ;;
*.gz)        gunzip $1      ;;
*.tar)       tar xf $1      ;;
*.tbz2)      tar xjf $1     ;;
*.tgz)       tar xzf $1     ;;
*.zip)       unzip $1       ;;
*.Z)         uncompress $1  ;;
*.7z)        7z x $1        ;;
*)     echo "'$1' cannot be extracted via extract()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}   
