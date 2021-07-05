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

PS1='\[\e[36;1m\]\u@\[\e[1;35m\]\H> \[\e[0;91m\][ \[\e[1;34m\]\[\e[32;1m\]\w\[\e[1;37m\] ]$(__git_ps1 " \[\e[0;91m\](\[\e[33;1m\]שׂ %s\[\e[1;37m\])")\n\[\e[1;32m\]\$\[\e(B\e[m\]  '

# ========= FUNCTIONS =========== #

man() {
    LESS_TERMCAP_md=$'\e[01;31m'    \
    LESS_TERMCAP_me=$'\e[0m'        \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_se=$'\e[0m'        \
    LESS_TERMCAP_us=$'\e[01;32m'    \
    LESS_TERMCAP_ue=$'\e[0m'        \
    command man "$@"
}

swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

one-piece() {
    CACHE_FILE="${XDG_CACHE_HOME}/one_piece"
    if [ "$1" = "-l" ]; then
        EP=$(cat "$CACHE_FILE")
    else
        EP="$1"

        [ -z "$EP" ] && {
            [ -f "$CACHE_FILE" ] && EP=$(($(cat "$CACHE_FILE") + 1)) || EP=1
        }
    fi

    while true; do
        mpv --no-input-terminal --quiet                  \
            "https://pitou.goyabu.com/one-piece/$EP.mp4" \
            && echo "$EP" >| $XDG_CACHE_HOME/one_piece

        echo -n "Continuar assistindo? [Y/n]: "
        read -r ANSWER

        [ "$ANSWER" = "n" ] && break
        EP=$(($EP + 1))
    done
}

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

ALIASES_FILE="$XDG_CONFIG_HOME/shell/aliases"
[ -f "$ALIASES_FILE" ] && source "$ALIASES_FILE"
