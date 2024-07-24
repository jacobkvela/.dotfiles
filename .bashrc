#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# used by various programs to determine default editors
export EDITOR=vim
export VISUAL=vim

# rust add to path 
. "$HOME/.cargo/env"

# compression function ##

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


# extract function #
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
