# reload zsh config
alias zreload='source $ZDOTDIR/.zshrc'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."

alias ls="ls --color"
alias l="ls -lah --color"
alias la="ls -AF --color"
alias ll="ls -lFh --color"
alias lld="ls -l | grep ^d"

alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
