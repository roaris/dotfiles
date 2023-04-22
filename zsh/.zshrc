# ブランチ名を表示
git_branch() {
    git branch --no-color 2>/dev/null | sed -n 's/^\* \(.*\)$/\1/p'
}

PS1='%F{cyan}%n%f%F{green}%~%f:%F{magenta}$(git_branch)%f
$ '

mkcd() {
    mkdir $1
    cd $1
}

alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
