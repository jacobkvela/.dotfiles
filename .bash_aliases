# bash aliases

# bat - a cat(1) clone with syntax highlighting and git intergration
alias cat="batcat"

# bat - a cat(1) clone with syntax highlighting and git intergration
alias bat="batcat"

# cd popd
alias ..="cd .."

# cd popdd
alias ...="cd ../.."

#disk usage sort in reverse order
#alias duu="du -ah . | sort -hr | head -n 10"

#prompt before copy
alias cp="cp -i"

#du-dust disk usage information
alias du="dust"

#fzf man pages for commands
alias fman="compgen -c | fzf | xargs man"

# git push - Push changes to the Github respository
alias gitpush="git push --set-upstream origin main"

#prompt before move
alias mv="mv -i"

#prompt before removal
alias rm="rm -i"

# update packages
alias update="sudo pacman -Syu"
