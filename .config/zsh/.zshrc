### TODO
#export thevarious environment variables
#move as much as I can to ~/.config
#
#
# display how long all tasks over 10 seconds take
export REPORTTIME=10

# Configure history file and size
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Completion (compinit)  and colored theme (promptinit)
autoload -Uz compinit promptinit
compinit
promptinit

# LS_COLORS
# To color the output of ls
#if [ "$TERM" = "xterm-256color" ]; then
#  eval $( dircolors -b $HOME/.config/theme/.dircolors )
#fi

# For autocompletion with an arrow-key driven interface,
zstyle ':completion:*' menu select

# For autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# Allow substituion on the PROMPT variable
setopt PROMPT_SUBST

# Enable Up/Down to be used as a "history search"
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


# Add zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## TODO 
# remember last dir
#


# Navigation keys
# - Home               : go to begining of line
# - End                : go to end of the line
# - Ctrl+Right Arrow   : go foward one word
# - Ctrl+Left Arrow    : go back one word
#
bindkey '^[[1;5D' backward-word 
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char



# source all .zsh files inside of the zsh/ directory
# Currently this will source:
# - PROMPT
# - COLORS
# - FUNCTIONS 
# - ALIASES
export ZSH=$HOME/.config/zsh
for config ($ZSH/**/*.zsh) source $config

