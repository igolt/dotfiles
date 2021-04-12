#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.config/nnn/config
source /usr/share/git/completion/git-prompt.sh

GIT_PS1_SHOWUNTRACKEDFILES="true"
# GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWDIRTYSTATE="true"

PS1='\[\e[36;1m\]\u@\[\e[1;35m\]\H> \[\e[0;91m\][ \[\e[1;34m\]\[\e[32;1m\]\w\[\e[1;37m\] ]$(__git_ps1 " \[\e[0;91m\](\[\e[33;1m\]%s\[\e[1;37m\])")\n\[\e[1;32m\]\$\[\e(B\e[m\]  '

# ========= FUNCTIONS =========== #

swap() {
	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

one-piece() {
	mpv "https://pitou.goyabu.com/one-piece/$1.mp4"
}

# ======= SHELL BEHAVIOR ======== #

shopt -s autocd
shopt -s cdspell
set -o noclobber

# ======== COMPLETITION ========= #

source /usr/share/git/completion/git-completion.bash
complete -c sudo
complete -c pidof
complete -c killall
complete -c man

# =========== ALIASES =========== #

# colors
alias ls='ls --color=auto'
alias diff='diff --color=auto'

# git
alias ga='git add'
alias gs='git status'
alias gp='git push'
alias gpsh='git push'
alias gpl='git pull'
alias gl='git log'

# gcc
alias wacc='gcc -W -Wall -ansi -pedantic'
alias w++='g++ -W -Wall -std=c++11'

# avoiding errors
alias sl='ls'
alias claer='clear'
alias clera='clear'

# ffplay
alias ffplay='ffplay -loglevel warning'

# update the system
alias updt='sudo pacman -Syu'

# zathura
alias zathura='zathura --fork'

# rm
alias rm='rm -i'

# conky
alias conky-todo='conky -c ~/.config/conky/conky_todo.conf'

# nnn
alias nnn='nnn -e'

# edit config files
alias evimrc="$EDITOR ${HOME}/.config/nvim/init.vim"
alias ebashrc="$EDITOR ${HOME}/.bashrc && source ${HOME}/.bashrc"
