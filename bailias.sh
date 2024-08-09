export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[31;1m\]\w\[\033[37m\]$(parse_git_branch)\[\033[m\]$ '

alias vi='nvim'
alias gs='git status'

die() {
    if [ -z $(pgrep -f $1) ]; then
        printf "No $1 processes...\n"
    else
        printf "Killing all $1 processes... \n"
        pkill --signal 9 -f $1
    fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
