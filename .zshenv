# -*- Mode: Shell-script -*-
#
#
PATH=/usr/local/bin:~/bin:$PATH
PATH=~/work/arduino:$PATH
PATH=~/.anyenv/bin:$PATH
PATH=~/.rbenv/bin:$PATH
PATH=~/.cask/bin:$PATH
PATH=~/.local/bin:$PATH

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

if [ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
    export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
fi
export JLESSCHARSET=japanese
export PERL5LIB=~/perl5/lib/perl5

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

# # anyenv
ENVS="anyenv pyenv rbenv nodenv"

for e in `echo $ENVS`; do
  if type -a $e > /dev/null 2>&1 ; then
    eval "$($e init - --no-rehash)"
  fi
done
