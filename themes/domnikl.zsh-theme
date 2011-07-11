# Hey ho - let's go!

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

# are you root? show me!
IAM=""
if [ "$UID" = "0" ]; then
	IAM="%{$fg[red]%}root|%{$reset_color%}"
fi

# are you at home here?

AT_HOME=""
WORKING_DIR=`pwd`
if [ "$WORKING_DIR" = "$HOME" ]; then
	AT_HOME="%{$fg[yellow]%}home, sweet home!%{$fg[red]%}|%{$reset_color%}"
fi

PROMPT='$IAM$AT_HOME%{$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%} '

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS='Gxdxhxhxbxegedabagacad'
