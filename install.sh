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

# sym link for .screenrc file
if [ ! -f "$HOME/.screenrc" ]; then
	echo -n "creating $HOME/.screenrc for screen settings ... "
	ln -s $WD/.screenrc $HOME/.screenrc
	echo $OK_FLAG
fi

# install ssh blacklisting tool
if [ ! -f "$HOME/bin/sshblack" ]; then
	echo -n "setting new symlink for sshblack"
	ln -s $WD/bin/sshblack $HOME/sshblack
	echo $OK_FLAG

	echo "running sshblack for the first time"
	sudo $WD/bin/sshblack/sshblack.pl
fi

echo ""
echo " => now run 'chsh -s $ZSH_PATH' to change your used shell to activate settings"
