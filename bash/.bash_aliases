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
alias ~='cd ~'
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
alias bat='bat --color=always'
alias cat='bat --color=always --paging=never'
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
alias ncmpcpp='ncmpcpp 2>/dev/null'

#==========================================================
# SYSTEM MANAGEMENT (ARCH/PACMAN)
#==========================================================
alias install='sudo pacman -S'
alias search='pacman -Ss'
alias uninstall='sudo pacman -Rns'
alias update='sudo pacman -Syy'
alias upgrade='sudo pacman -Syu'
alias clean='sudo pacman -Sc'      # Clean package cache
alias autoremove='sudo pacman -Rns $(pacman -Qdtq)'  # Remove orphans

# System info
alias installed='pacman -Q | wc -l'  # Count installed packages

#==========================================================
# POWER MANAGEMENT
#==========================================================
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'
alias suspend='systemctl suspend'

#==========================================================
# GIT SHORTCUTS
#==========================================================
#alias g='git'
#alias ga='git add'
#alias gaa='git add .'
#alias gc='git commit -m'
#alias gca='git commit -am'
#alias gp='git push'
#alias gpull='git pull'
#alias gs='git status'
#alias gd='git diff'
#alias gl='git log --oneline --graph --decorate --all'
#alias gco='git checkout'
#alias gb='git branch'
#alias gitpush='git push --set-upstream origin main'
#
## Git dotfiles management
#alias dotfiles='cd ~/.dotfiles'
#alias dotpush='cd ~/.dotfiles && git add . && git commit -m "Update dotfiles" && git push'
#alias dotstatus='cd ~/.dotfiles && git status'

#==========================================================
# FZF UTILITIES
#==========================================================
alias fman='compgen -c | fzf | xargs man'  # Fuzzy search man pages
alias fcd='cd $(find . -type d | fzf)'     # Fuzzy find directory and cd

#==========================================================
# TMUX
#==========================================================
#alias t='tmux'
#alias ta='tmux attach -t'
#alias tl='tmux list-sessions'
#alias tn='tmux new -s'
#alias tk='tmux kill-session -t'

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
#alias myip='curl ifconfig.me'     # Get public IP
#alias ping='ping -c 5'            # Limit to 5 pings

#==========================================================
# MISC UTILITIES
#==========================================================
#alias c='clear'
#alias h='history'
#alias j='jobs -l'
#alias path='echo -e ${PATH//:/\\n}'  # Print PATH, one per line
#alias now='date +"%T"'
#alias nowdate='date +"%Y-%m-%d"'

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
#alias weather='curl wttr.in'

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
