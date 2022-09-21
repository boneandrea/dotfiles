# -*- Mode: Shell-script -*-
#
# ~/.zshrc
#
#
PATH=/usr/local/bin:~/bin:$PATH
PATH=~/work/arduino/IDE/arduino:$PATH
PATH=~/.local/bin:$PATH
PATH=/opt/android-studio/bin:$PATH

# eclipse LUNA
PATH=/opt/eclipse-luna:$PATH

export PATH

#
# --- environment variables ---
#
export LANG=C
export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8
export LC_TIME=C
export LC_MESSAGES=C
export EDITOR=vi
export PAGER=less
export LESS='-Q -i -r -R'

export JLESSCHARSET=japanese
export PERL5LIB=~/perl5

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

# GNU screen
export SCREENDIR=~/.screen

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Java (ARM) CROSS ENV
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH
export LD_LIBRARY_PATH=/usr/arm-linux-gnueabihf/lib

# bcで小数
export BC_ENV_ARGS=-l

