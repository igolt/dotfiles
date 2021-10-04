#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "$XDG_CONFIG_HOME/bash/functions"
source ~/.config/nnn/config
source /usr/share/git/completion/git-prompt.sh

GIT_PS1_SHOWUNTRACKEDFILES="true"
# GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWDIRTYSTATE="true"

PS1='\[\e[36;1m\]\u@\[\e[1;35m\]\H> \[\e[0;91m\][ \[\e[1;34m\]\[\e[32;1m\]\w\[\e[1;37m\] ]$(__git_ps1 " \[\e[0;91m\](\[\e[33;1m\] %s\[\e[1;37m\])")\n\[\e[1;32m\]\$\[\e(B\e[m\]  '

# ======= SHELL BEHAVIOR ======== #

shopt -s autocd
shopt -s cdspell
set -o noclobber

# ======== BASIC COMPLETION ========= #

source /usr/share/git/completion/git-completion.bash
complete -c sudo
complete -c pidof
complete -c killall
complete -c man
complete -c pgrep
complete -c pkill

# =========== ALIASES =========== #

#yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Managing dotfiles
alias dotfiles="git --git-dir='$HOME/.dotfiles' --work-tree='$HOME'"
alias d='dotfiles'

# Bookmarks
FACUL_DIR="$HOME/Files/Faculdade/2021"
alias cdfacul="cd $FACUL_DIR"
alias cdstenio="cd '$FACUL_DIR/DCC059 - Grafos'"
alias cdpassini="cd '$FACUL_DIR/DCC160 - Lógica e Fundamentos para a computação'"
alias cdvimrc="cd $XDG_CONFIG_HOME/nvim"

alias cdnrc="cd '$HOME/Develop/nrc'"

# ls
alias ls='ls --color=auto'
alias ll='ls -lh'
alias lll='ls -lhA'
alias lla='ls -lha'
alias la='ls -a'
alias lA='ls -A'

# diff
alias diff='diff --color=auto'

# grep
alias grep='grep --color=auto'

# git
alias g='git'
alias ga='git add'
alias gs='git status'
alias gp='git push'
alias grs='git restore --staged'
alias gcm='git commit -m'
alias gpsh='git push'
alias gpl='git pull'
alias gl='git log'

# gcc
alias wcc='gcc -W -Wall -pedantic'
alias wacc='wcc -ansi'
alias w++='g++ -W -Wall -pedantic -std=c++11'

# avoiding errors
alias vm='mv'
alias sl='ls'
alias claer='clear'
alias clera='clear'

# ffplay
alias ffplay='ffplay -loglevel warning'

# pacman
alias updt='sudo pacman -Syu'
alias pacinstall='sudo pacman -S'
alias pacremove='sudo pacman -Rns'
alias pacremoveun='sudo pacman -Rns $(pacman -Qdtq)'

# rm
alias rm='rm -i'

# conky
alias conky-todo='conky -c ~/.config/conky/conky_todo.conf'

# nmcli
alias wifi='nmcli device wifi'

# edit config files
[ -f "/etc/portage/make.conf" ] && alias emkconf="sudoedit /etc/portage/make.conf"
alias ebashrc='$EDITOR $HOME/.bashrc && source $HOME/.bashrc'
