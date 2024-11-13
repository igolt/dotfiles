export ZSH="$HOME/.local/share/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(colored-man-pages git docker zsh-autosuggestions)

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

source $HOME/.config/zsh/fzf-bindings.zsh

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

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
