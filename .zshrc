export ZSH="$HOME/.local/share/oh-my-zsh"

source "$HOME/.profile"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(colored-man-pages git docker docker-compose zsh-autosuggestions)

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$ZSH"/oh-my-zsh.sh

bindkey -v
bindkey -v '^n' autosuggest-accept
bindkey -s '^v' 'nvim\n'

alias vim=nvim
alias v=vim

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/fzf-keybindings.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases.zsh"

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

cdff() {
  local _DIR=`fd $@ | fzf`

  [ $? = 0 ] && {
    [ -d "$_DIR" ] || _DIR=`dirname "$_DIR"`
      cd "$_DIR"
    }
}

cdf() {
  local _DIR=`fd $@ --type d | fzf`

  [ $? = 0 ] && cd "$_DIR"
}

alias gs='git status'

alias mongo-prod="kubectl port-forward svc/mongodb 32000:27017 -n prod"
alias pg-prod="kubectl port-forward svc/postgres 32001:5432 -n prod"
alias mongo-homolog="kubectl port-forward svc/mongodb-homolog 31000:27017 -n homolog"
alias pg-homolog="kubectl port-forward svc/postgres-homolog 31001:5432 -n homolog"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. "$HOME/.local/share/../bin/env"
