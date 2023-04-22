function git_current_branch() {
    if [ ! -d ".git" ]; then
        return
    fi
    branch_icon='\ue0a0'
    # git branchの結果をsedで抽出
    branch_name=`git branch --no-color 2>/dev/null | sed -n 's/^\* \(.*\)$/\1/p'`
    git_status=`git status 2>/dev/null`
    if [[ -n `echo ${git_status} | grep "^nothing to"` ]]; then
        echo "%F{green}${branch_icon}${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^Untracked files"` ]]; then
        echo "%F{red}${branch_icon}?${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^Changes not staged for commit"` ]]; then
        echo "%F{red}${branch_icon}+${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^Changes to be committed"` ]]; then
        echo "%F{yellow}${branch_icon}${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^rebase in progress"` ]]; then
        echo "%F{red}${branch_icon}!(no branch)%f"
    else
        echo "%F{blue}${branch_icon}${branch_name}%f"
    fi
}

# プロンプトが表示されるたびに評価する
setopt prompt_subst

PS1='%F{cyan}%~%f `git_current_branch`
$ '

mkcd() {
    mkdir $1
    cd $1
}

alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
