#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/git/completion/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"

PS1='\[\e[36;1m\]\u@\[\e[1;35m\]\H \[\e[0;91m\][ \[\e[1;34m\]\[\e[32;1m\]\w\[\e[1;37m\] ]$(__git_ps1 " \[\e[0;91m\](\[\e[33;1m\] %s\[\e[1;37m\])")\n\[\e[1;32m\]\$\[\e(B\e[m\] '

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

if [ -f "/usr/share/fzf/key-bindings.bash" ]; then
    source "/usr/share/fzf/key-bindings.bash"
fi

source "$XDG_CONFIG_HOME/nnn/config"

source "$XDG_CONFIG_HOME/bash/aliases"
source "$XDG_CONFIG_HOME/bash/functions"
