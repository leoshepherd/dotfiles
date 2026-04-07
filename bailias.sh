source ~/dotfiles/prompt/pastel.sh
export PS1=$'$(_fg ${USER_BG})$(_fg ${USER_TEXT})$(_bg ${USER_BG}) \u$(_fg ${USER_BG})$(_bg ${DIR_BG})$(_fg ${DIR_TEXT})  \w$(_fg ${DIR_BG})$(_bg ${SEP_BG1})$(_fg ${SEP_BG1})$(_bg ${SEP_BG2})$(_fg ${SEP_BG2})$(_bg ${SEP_BG3})$(_fg ${SEP_BG3})$(_bg ${GIT_BG})$(_fg ${GIT_TEXT})$(parse_git_branch)\e[0m$(_fg ${GIT_BG})\e[0m\n '

alias vi='nvim'
alias gs='git status -sb'
alias gc='git checkout'
alias ll='ls -la --color=auto'

_fg() {
    hex=${1#\#}
    r=$((16#${hex:0:2}))
    g=$((16#${hex:2:2}))
    b=$((16#${hex:4:2}))
    printf "\e[38;2;%d;%d;%dm" $r $g $b
}

_bg() {
    hex=${1#\#}
    r=$((16#${hex:0:2}))
    g=$((16#${hex:2:2}))
    b=$((16#${hex:4:2}))
    printf "\e[48;2;%d;%d;%dm" $r $g $b
}

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
