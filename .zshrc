# -*- Mode: Shell-script -*-
#
# ~/.zshrc
#
PATH=/usr/local/bin:~/lib/emacs/bin:~/bin:$PATH
PATH=~/work/arduino:$PATH
PATH=/home/banchou/.cask/bin:$PATH
PATH=~/.rbenv/bin:$PATH


ANDROID_ROOT=/opt/adt-bundle-linux-x86_64

PATH=${ANDROID_ROOT}/eclipse:${ANDROID_ROOT}/sdk/platform-tools:$PATH
PATH=${ANDROID_ROOT}/sdk/tools:$PATH

PATH=/opt/google/chrome:$PATH

# eclipse LUNA
PATH=/opt/eclipse-luna:$PATH

export PERL5LIB=~/perl5/lib/perl5

export PATH

	stty erase 
	stty kill 
	stty susp 
	unlimit
	limit stack 8192
#	limit core 0
	limit -s
	umask 022
	#cdpath=( . ~/ $cdpath )
#
# --- shell variables ---
#
	HISTFILE=~/.zhistory-$HOST
#	fignore=(.bak .old .org .orig .o)
	MAILCHECK=30
	HISTSIZE=1000
	DIRSTACKSIZE=50

	SAVEHIST=800
	LOGCHECK=0
	READNULLCMD=less

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
	#export LESS='-Q -i -r'
	export LESS='-R'
	export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
	export JLESSCHARSET=japanese
	export MAILCALL='NEW MAIL! '
	export YOUSAID='In %C you wrote:'
	export ATTRIBUTION='%f wrote:'
	export XLIB_SKIP_ARGB_VISUALS=1


export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

#


#
# --- Shell options ---
#
setopt		AUTO_LIST AUTO_PARAM_SLASH LIST_TYPES APPEND_HISTORY \
		EXTENDED_HISTORY HIST_IGNORE_DUPS \
		AUTO_CD  CORRECT MARK_DIRS NO_HUP SUN_KEYBOARD_HACK \
		ALWAYS_LAST_PROMPT EXTENDED_GLOB  CORRECT_ALL \
		ALWAYS_TO_END \
		AUTO_PARAM_KEYS AUTO_REMOVE_SLASH \
		BRACE_CCL COMPLETE_IN_WORD HASH_CMDS \
		HASH_DIRS LIST_AMBIGUOUS \
		LIST_TYPES NO_CLOBBER NO_HUP NO_LIST_BEEP \
		HIST_NO_STORE MONITOR NOTIFY IGNORE_EOF PROMPT_SUBST PRINT_EIGHT_BIT
#setopt	MENU_COMPLETE

unsetopt	AUTO_PUSHD \
		AUTO_RESUME XTRACE RM_STAR_SILENT CHASE_LINKS \
		AUTO_MENU AUTO_NAME_DIRS BG_NICE COMPLETE_ALIASES \
		MENU_COMPLETE \
		NO_NOMATCH NO_RCS REC_EXACT CORRECT_ALL

#
# --- aliases ---
#
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi



if [ -f ~/.dircolors ]; then
	eval `dircolors -b ~/.dircolors`
fi

# --- bindings ---
#
	bindkey -e
	bindkey '^P' history-beginning-search-backward
	bindkey '^N' history-beginning-search-forward
	bindkey '^G' spell-word

	bindkey ' ' magic-space
	bindkey '^X^Z' universal-argument ' ' magic-space
	bindkey '^X^A' vi-find-prev-char-skip
	bindkey -s '\M-/' \\\\
	bindkey -s '\M-=' \|

#
# --- completion ---
#
autoload -U compinit
compinit


# --- show git branchname ---

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#
# --- prompt ---
#

if [ "x"$WINDOW = "x" ]; then
	PROMPT="%{%B[34m%}`whoami`@`hostname -s`:%c%b%{[m%}%% "
else
	COLOR=3`expr $WINDOW % 7`
	PROMPT="%{%B[${COLOR}m%}`whoami`@`hostname -s`[$WINDOW]:%c%b%{[m%}%% "
fi
	
#        RPROMPT=' %~ [%T]'
RPROMPT=' %~ %1(v|%F{green}%1v%f|) [%T]'


if [ -x `which dircolors` ]; then
  dircolors -p >| ~/.dir_colors
fi

if [ -f ~/.dir_colors ]; then
  eval $(dircolors ~/.dir_colors)
fi

#cd ~

# RVM
#[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "/home/banchou/.rvm/scripts/rvm" ]] && source "/home/banchou/.rvm/scripts/rvm"  # This loads RVM into a shell session.


umask 022

urlencode () {
        echo $* | nkf -wMQ | tr = %
}
urldecode () {
        echo $* | tr % = | nkf -wmQ
}

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

xmodmap $HOME/.Xmodmap 2> /dev/null


# Java (ARM) CROSS ENV

export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH
export LD_LIBRARY_PATH=/usr/arm-linux-gnueabihf/lib

alias xm="xmodmap ~/.Xmodmap"


# GNU screen
export SCREENDIR=$HOME/.screen

