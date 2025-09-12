export PS1='\[\033[36m\] \u\[\033[32m\]  \h:\[\033[31;1m\]  \w\[\033[37m\]$(parse_git_branch)\[\033[m\]\n '

alias vi='nvim'
alias gs='git status'
alias gc='git checkout'
alias ll='ls -la --color=auto'

grs() {
    git reset --soft HEAD~$1
}

grh() {
    git reset --hard HEAD~$1
}

die() {
    if [ -z $(pgrep -f $1) ]; then
        printf "No $1 processes...\n"
    else
        printf "Killing all $1 processes... \n"
        pkill --signal 9 -f $1
    fi
}

parse_git_branch() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    branch=${ref#refs/heads/}
    isTracked=`git branch -a | grep $branch | wc -l`
    if [ "$isTracked" -ge "2" ]; then
        branch="$branch"
    fi
    echo "  $branch"
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
