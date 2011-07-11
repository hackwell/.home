# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# disabled due to custom theme
export ZSH_THEME=""

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate)

source $ZSH/oh-my-zsh.sh

export DOT_HOME=$HOME/.home
export PATH=$PATH:$DOT_HOME/bin

if [ -d "$HOME/bin" ]; then
	export PATH=$PATH:$HOME/bin
fi

# load custom theme
source $DOT_HOME/themes/domnikl.zsh-theme

# set environment variables ...
source $DOT_HOME/.environment_variables

# fortune cookie ;-)
source $DOT_HOME/.fortune

source $DOT_HOME/.macports

# add a local .local.zshrc file, if it exists
if [ -f "$HOME/.local.zshrc" ]; then
	source $HOME/.local.zshrc
fi
