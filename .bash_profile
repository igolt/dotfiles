#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$PATH"

# Default programs
export PAGER="less"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"

# XDG Base Directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# SQLite
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite/history"

# npm
export PATH="$PATH:$XDG_DATA_HOME/npm/bin"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# node
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node/node_repl_history"

# X11
_X11_CONFIG_DIR="$XDG_CONFIG_HOME/X11"

export XINITRC="$_X11_CONFIG_DIR/xinitrc"
export XSERVERRC="$_X11_CONFIG_DIR/xserverrc"
export XRESOURCES="$_X11_CONFIG_DIR/Xresources"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# gtk2
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# bash
export HISTFILE="$XDG_DATA_HOME/bash/history"

# less
export LESSHISTFILE="-"

# readline
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# distcc
export DISTCC_DIR="$XDG_CONFIG_HOME/distcc"

# gnupg
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# cargo
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"

# Java
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications on BSPWM
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export JDK_JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/init.py"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# todo file
export TODO_FILE="$XDG_DATA_HOME/todo.md"

# gcc env vars
_LOCAL_LIB="$HOME/.local/lib"

export C_INCLUDE_PATH="$HOME/.local/include"
export LIBRARY_PATH="$_LOCAL_LIB/goat:$_LOCAL_LIB/cbook"
export LD_LIBRARY_PATH="$_LOCAL_LIB/goat:$_LOCAL_LIB/cbook"

# dotfiles git directory
export _DOTSDIR="$XDG_DATA_HOME/dotfiles"

_PRIVATE_PROFILE=$XDG_CONFIG_HOME/bash/private-profile

[ -f "$_PRIVATE_PROFILE" ] && . "$_PRIVATE_PROFILE"
[ -f ~/.bashrc ] && . ~/.bashrc
