### TODO
# export the various environment variables
# move as much as I can to ~/.config
#
#export GNUPGHOME=~/.config/gnupg
#export ZDOTDIR=~/.config/zsh
#export tmux???
#base16 (maybe)
#what else?


# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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
# From: https://github.com/trapd00r/LS_COLORS
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
# TODO update to use keybind command create a .zkbd file etc... 


# CDR - remember last visited folders
# to use do cdr -l and then cd <NUM>
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection


# Navigation keys
# - Home               : go to begining of line
# - End                : go to end of the line
# - Ctrl+Right Arrow   : go foward one word
# - Ctrl+Left Arrow    : go back one word
#
# TODO update to use keybind command 
bindkey '^[[1;5D' backward-word 
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char


## Source other configuration files:

# Add zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source all .zsh files inside of the zsh/ directory
# Currently this will source:
# - PROMPT
# - COLORS
# - FUNCTIONS 
# - ALIASES
for config ($ZDOTDIR/**/*.zsh) source $config

