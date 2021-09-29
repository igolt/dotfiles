#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$PATH"

export SCREEN_RES="1920x1080"

# Default programs
export VISUAL="nvim"
export BROWSER="brave"
export EDITOR="nvim"
export PAGER="less"

# XDG Base Directory
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# SQLite
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite/history"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="$PATH:$XDG_DATA_HOME/npm/bin"

# node
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node/node_repl_history"

# X11
X11_CONFIG_DIR="$XDG_CONFIG_HOME/X11"
export XINITRC="$X11_CONFIG_DIR/xinitrc"
export XSERVERRC="$X11_CONFIG_DIR/xserverrc"
export XRESOURCES="$X11_CONFIG_DIR/Xresources"
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

# todo file
export TODO_FILE="$XDG_DATA_HOME/todo.md"

export C_INCLUDE_PATH="$HOME/.local/include"
export LD_LIBRARY_PATH="$HOME/.local/lib/goat"

[ -f ~/.bashrc ] && . ~/.bashrc
