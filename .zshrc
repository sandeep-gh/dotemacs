#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sandeep/.zshrc'

autoload -Uz compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall
autoload -U promptinit
promptinit
alias emc=emacsclient
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt SHARE_HISTORY
setopt APPEND_HISTORY
function precmd {
hpwd=$history[$((HISTCMD-1))]
if [[ $hpwd == "cd" ]]; then
cwd=$OLDPWD
else
cwd=$PWD
fi
hpwd="${hpwd% ### *} ### $cwd ### `date`"
echo "$hpwd" >>~/.hist_log
}
alias pi='pushd'
alias po='popd'
alias dirs="dirs -v"


. /home/shared/env.sh
