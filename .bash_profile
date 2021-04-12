#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$PATH"

export BROWSER="brave"
export EDITOR="nvim"
export PAGER="less"

# XDG Base Directory
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# X11
X11_CONFIG_DIR="${XDG_CONFIG_HOME}/X11"
export XINITRC="${X11_CONFIG_DIR}/xinitrc"
export XSERVERRC="${X11_CONFIG_DIR}/xserverrc"
export XRESOURCES="${X11_CONFIG_DIR}/Xresources"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# bash
export HISTFILE="${XDG_DATA_HOME}/bash/history"

# less
export LESSHISTFILE="-"

# readline
export INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc"

# distcc
export DISTCC_DIR="${XDG_CONFIG_HOME}/distcc"

# gnupg
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"

# cargo
export CARGO_HOME="${XDG_CONFIG_HOME}/cargo"

[[ -f ~/.bashrc ]] && . ~/.bashrc
