# xclip
alias clip='xclip -selection clipboard'

# Managing dotfiles
alias dotfiles='git --git-dir="${_DOTSDIR:-$HOME/.dotfiles}" --work-tree="$HOME"'
alias d='dotfiles'
alias ds='dotfiles status'
