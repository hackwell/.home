#!/bin/bash

WD=`pwd`
REPO="git://github.com/robbyrussell/oh-my-zsh.git"
LOCAL_SETTINGS="$HOME/.local.zshrc"
SETTINGS="$HOME/.zshrc"
OK_FLAG=" [OK]"
ZSH_PATH=`which zsh`

# eventually check out oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo -n "need to clone oh-my-zsh repository from $REPO ... "
	git clone $REPO $HOME/.oh-my-zsh
	echo $OK_FLAG
fi

# delete existing .zshrc
if [ -f "$SETTINGS" ]; then
	echo -n "deleting $SETTINGS ... "
	rm $SETTINGS
	echo $OK_FLAG
fi

# setting new symlink
echo -n "setting new symlink for .zshrc ... "
ln -s $WD/.zshrc $HOME/.zshrc
echo $OK_FLAG

# check for dependencies ...

# add an empty $HOME/.local.zshrc file
if [ ! -f "$LOCAL_SETTINGS" ]; then
	echo -n "creating $HOME/.local.zshrc file for your local settings ... "
	touch $HOME/.local.zshrc
	echo $OK_FLAG
fi

if [ ! -f "$HOME/.screenrc" ]; then
	echo -n "creating $HOME/.screenrc for screen settings ... "
	ln -s $WD/.screenrc $HOME/.screenrc
	echo $OK_FLAG
fi

echo ""
echo " => now run 'chsh -s $ZSH_PATH' to change your used shell to activate settings"
