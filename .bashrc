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

PS1='\[\e[36;1m\]\u@\[\e[1;35m\]\H> \[\e[0;91m\][ \[\e[1;34m\]\[\e[32;1m\]\w\[\e[1;37m\] ]$(__git_ps1 " \[\e[0;91m\](\[\e[33;1m\] %s\[\e[1;37m\])")\n\[\e[1;32m\]\$\[\e(B\e[m\]  '

# ========= FUNCTIONS =========== #

mkclassf() {
    local FOLDER="$1"
    local SLIDES_FOLDER="$FOLDER/Slides"
    local EXERCISES_FOLDER="$FOLDER/Exercícios"
    local VIDEOS_FOLDER="$FOLDER/Vídeos"

    mkdir "$FOLDER"                  \
        && mkdir "$SLIDES_FOLDER"    \
        && mkdir "$EXERCISES_FOLDER" \
        && mkdir "$VIDEOS_FOLDER"
}

man() {
    LESS_TERMCAP_md=$'\e[01;31m'    \
    LESS_TERMCAP_me=$'\e[0m'        \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_se=$'\e[0m'        \
    LESS_TERMCAP_us=$'\e[01;32m'    \
    LESS_TERMCAP_ue=$'\e[0m'        \
    command man "$@"
}

watch-dot() {
    dot -Txlib "$1" &
}

swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

one-piece() {
    CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/one_piece"

    if [ "$1" = "-l" ]; then
        EP=$(cat "$CACHE_FILE")
    else
        EP="$1"

        [ -z "$EP" ] && {
            [ -f "$CACHE_FILE" ] && EP=$(($(cat "$CACHE_FILE") + 1)) || EP=1
        }
    fi

    while true; do
        mpv --no-input-terminal --really-quiet           \
            "https://pitou.goyabu.com/one-piece/$EP.mp4" \
            && echo "$EP" >| "$CACHE_FILE"

        echo -n "Continuar assistindo? [Y/n]: "
        read -r ANSWER

        [ "$ANSWER" = "n" ] && break
        EP=$(($EP + 1))
    done
}

compile-dwm() {
    pushd ~/AUR/dwm
    ./install.sh
    popd
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
