function git_branch() {
    # git branchの結果をsedで抽出
    git branch --no-color 2>/dev/null | sed -n 's/^\* \(.*\)$/\1/p'
}

# プロンプトが表示されるたびに評価する
setopt prompt_subst

PS1='%F{cyan}%n%f%F{green}%~%f:%F{magenta}`git_branch`%f
$ '

mkcd() {
    mkdir $1
    cd $1
}

alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
