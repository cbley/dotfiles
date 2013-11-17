alias cdc="cd && clear"
alias tmux="TERM=screen-256color-bce tmux"
alias myip="curl ifconfig.me"
alias s="screen"
alias t="tmux"
alias tma='tmux attach -d -t'
alias tt='tma $(basename $(pwd))'
alias tl='tmux new -s $(basename $(pwd))'
alias c="clear"
alias g="git"
alias gsu="git submodule init && git submodule update"
alias gsp="git submodule foreach git pull origin master"
alias gfv="git fetch origin -v; git fetch upstream -v"

