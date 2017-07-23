#!/bin/sh

###
#
# This is my script for ArchLinux
# I'll install Arch specific stuff here.
#
##

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh


if type git >/dev/null 2>&1; then 
  echo "git already installed" 
else
  echo "installing git..." 
  pacman -S git
fi

#Install AUR package manager
# apacman: https://github.com/oshazard/apacman

if type apacman >/dev/null 2>&1; then 
  echo "apacman already installed" 
else
  echo "installing apacman..." 

  mkdir -p $HOME/Git
  cd $HOME/Git

  pacman -S --needed --asdeps jshon
  curl -O "https://raw.githubusercontent.com/oshazard/apacman/master/apacman"
  cd apacman
  bash ./apacman -S apacman
  apacman -S apacman-deps
fi

if type packer-color >/dev/null 2>&1; then 
  echo "packer-color already installed" 
else
  echo "installing packer-color..." 
  apacman -S packer-color
fi

CHECK=`ls /usr/share/zsh/plugins`
plugin='zsh-syntax-highlighting'

if test "${CHECK#*$plugin}" != "$CHECK"; then
  echo "zsh-syntax-highlighting already installed" 
else
  echo "installing zsh-syntax-highlighting..." 
  pacman -S zsh-syntax-highlighting
fi


echo "installing .config files:"
#ls $SCRIPTDIR/.config
#echo $0

SCRIPTDIR=`$(dirname "${0}")`
cp $SCRIPTDIR/.config/* $HOME/.config
