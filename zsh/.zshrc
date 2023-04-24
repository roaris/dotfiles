get_current_branch() {
    if [ ! -e ".git" ]; then
        return
    fi
    branch_icon='\ue0a0'
    # git branchの結果をsedで抽出
    branch_name=`git branch --no-color 2>/dev/null | sed -n 's/^\* \(.*\)$/\1/p'`
    git_status=`git status 2>/dev/null`
    if [[ -n `echo ${git_status} | grep "^nothing to"` ]]; then
        echo "%F{002}${branch_icon}${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^Untracked files"` ]]; then
        echo "%F{009}${branch_icon}?${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^Changes not staged for commit"` ]]; then
        echo "%F{009}${branch_icon}+${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^Changes to be committed"` ]]; then
        echo "%F{003}${branch_icon}${branch_name}%f"
    elif [[ -n `echo ${git_status} | grep "^rebase in progress"` ]]; then
        echo "%F{009}${branch_icon}!(no branch)%f"
    else
        echo "%F{004}${branch_icon}${branch_name}%f"
    fi
}

# プロンプトが表示されるたびに評価する
setopt prompt_subst

PS1='%F{030}%~%f %D{%H:%M} `get_current_branch`
$ '

# 60秒毎に更新する
TMOUT=60
TRAPALRM() {
    zle reset-prompt
}

mkcd() {
    mkdir $1
    cd $1
}

alias ls='ls -FG'
alias grep='grep --color=auto'

# キーバインドの設定(vimっぽく)
bindkey "^h" backward-char
bindkey "^l" forward-char
bindkey "^b" backward-word
bindkey "^w" forward-word

# カスタマイズする時用の色確認
colorlist() {
    for c in {000..255}; do
        echo -n "\e[38;5;${c}m$c "
        if [ $(($c%16)) -eq 15 ]; then
            echo
        fi
    done
}
