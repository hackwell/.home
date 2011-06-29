#!/bin/bash

WD=`pwd`

# eventually check out oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

# delete existing .zshrc
rm -f $HOME/.zshrc

# setting new symlink
ln -s $WD/.zshrc $HOME/.zshrc

# check for dependencies ...

