#!/bin/sh

###
#
# This is my script for ArchLinux
# I'll install Arch specific stuff here.
#
##

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

if [ ! -f  /etc/zsh/zshenv ]; then

    mkdir -p /etc/zsh
    touch /etc/zsh/zshenv
    
    echo 'export XDG_CONFIG_HOME=$HOME/.config' >> /etc/zsh/zshenv
    echo 'export ZDOTDIR=$XDG_CONFIG_HOME/zsh' >> /etc/zsh/zshenv

    echo "file /etc/zsh/zshenv created.."
else
    echo "file /etc/zsh/zshenv already exists, skipping..."
	#TODO Validate that file actually contain environments variables above
fi

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


# It is my intent to override all the files
# in case the .zshrc file is not present in the folder
# makes for an easy update / cleanup
SCRIPTDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f  $ZDOTDIR/.zshrc ]; then


	echo "adding .config/zsh files:"
	ls $SCRIPTDIR/.config/zsh/*
	cp -r "$SCRIPTDIR/.config/zsh" "$XDG_CONFIG_HOME"

    echo "done adding zsh config files"
else
    echo "file $ZDOTDIR/.zshrc already exists, skipping zsh config files..."
fi


if type nvim >/dev/null 2>&1; then 
  echo "neovim already installed" 
else
  echo "installing neovim and symlinks..." 
  pacman -S neovim neovim-symlinks
fi

# copy files only if init.vim is not present in the nvim folder
echo "$XDG_CONFIG_HOME/nvim/init.vim"
if [ ! -f  $XDG_CONFIG_HOME/nvim/init.vim ]; then

	echo "adding .config/nvim files:"
	ls $SCRIPTDIR/.config/nvim/*
	cp -r "$SCRIPTDIR/.config/nvim" "$XDG_CONFIG_HOME"

    echo "done adding nvim config files"
else
    echo "file $nvim_home/ini.vim already exists, skipping nvim config files..."
fi

