#==========================================================
# Bash Aliases
# Author: jacobkvela
# Description: Custom command aliases and shortcuts
#==========================================================

#==========================================================
# NAVIGATION
#==========================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Quick directory navigation
alias -- -='cd -'  # Go to previous directory

#==========================================================
# CORE UTILITIES (SAFER DEFAULTS)
#==========================================================
alias cp='cp -i'          # Prompt before overwrite
alias mv='mv -i'          # Prompt before overwrite
alias rm='rm -i'          # Prompt before removal

# Better defaults
alias mkdir='mkdir -pv'   # Create parent dirs, verbose
alias df='df -h'          # Human-readable sizes
alias free='free -h'      # Human-readable sizes

#==========================================================
# LISTING FILES
#==========================================================
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'        # Long format, all files
alias la='ls -A'          # All files except . and ..
alias l='ls -CF'          # Columns, type indicators
alias lt='ls -lht'        # Sort by modification time
alias lsize='ls -lhS'     # Sort by size

# Tree view (if you have tree installed)
alias tree='tree -C'      # Colorize output

#==========================================================
# FILE VIEWERS
#==========================================================
alias bat='batcat --color=always'
alias less='bat --paging=always'

#==========================================================
# DISK USAGE
#==========================================================
alias du='du -h'          # Human-readable
alias duu='dust'          # du-dust for better visualization
alias ncdu='ncdu --color dark'  # NCurses disk usage

#==========================================================
# GREP
#==========================================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#==========================================================
# MUSIC PLAYER
#==========================================================
#alias ncm='ncmpcpp 2>/dev/null'

#==========================================================
# SYSTEM MANAGEMENT (UBUNTU)
#==========================================================
alias install='sudo apt install'
alias search='apt search'
alias uninstall='sudo apt remove'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias autoremove='sudo apt autoremove'  # Remove orphans

# System info
alias installed='apt list --installed'  # Count installed packages

#==========================================================
# POWER MANAGEMENT
#==========================================================
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias suspend='systemctl suspend'

#==========================================================
# FZF UTILITIES
#==========================================================
alias fman='compgen -c | fzf | xargs man'  # Fuzzy search man pages
alias fcd='cd $(find . -type d | fzf)'     # Fuzzy find directory and cd

#==========================================================
# DEVELOPMENT
#==========================================================
alias python='python3'
alias pip='pip3'
alias py='python3'

# Quick server
alias serve='python3 -m http.server 8000'

#==========================================================
# NETWORK
#==========================================================
alias ports='netstat -tulanp'     # Show open ports

#==========================================================
# MISC UTILITIES
#==========================================================
# Quick edit important files
alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'
alias bashrc='vim ~/.bashrc && source ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.config/tmux/tmux.conf'

# Reload bash config
alias reload='source ~/.bashrc'

#==========================================================
# FUN
#==========================================================
# Make terminal colorful
alias weather='curl wttr.in'

#==========================================================
# SAFETY ALIASES (PREVENT COMMON MISTAKES)
#==========================================================
# Prevent accidental deletion of root
alias rm='rm -I --preserve-root'

# Prevent accidental chmod/chown on root
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#==========================================================
# NOTES:
#==========================================================
# To reload aliases after editing:
#   source ~/.bash_aliases
# Or use the 'reload' alias defined above
#
# To see all defined aliases:
#   alias
#
# To remove an alias temporarily:
#   unalias <alias-name>
#==========================================================
