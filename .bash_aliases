# bash aliases

# bat - a cat(1) clone with syntax highlighting and git intergration
alias cat="batcat"

#disk usage sort in reverse order
alias duu="du -CB . | sort -hr | head -n 10"

# cd popd
alias ..="cd .."

# cd popdd
alias ...="cd ../.."

# prompt before copy
alias cp="cp -i"

# du-dust disk usage information
#alias du="dust"

# fzf man pages for commands
alias fman="compgen -c | fzf | xargs man"

# git push - Push changes to the Github respository
alias gitpush="git push --set-upstream origin main"

# prompt before move
alias mv="mv -i"

# newsboat
alias rss="newsboat"

# prompt before removal
alias rm="rm -i"

# update repo
alias update="sudo pacman -Syy"

# upgrade packages
alias upgrade="sudo pacman -Syu"

# search repos for package
alias search="pacman -Ss"

# install package
alias install="sudo pacman -S"

# remove package
alias uninstall="sudo pacman -Rns"

# shutdown
alias shutdown="sudo shutdown -h now"

# netscanner
alias ns="sudo netscanner"
