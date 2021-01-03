#!/bin/bash

#WSLかどうか判定
if [[ "$(uname -r)" == *[Mm]icrosoft* ]]; then
  :
  #echo 'WSL'
fi

# disable ctrl-S
# (https://linuxfan.info/disable-ctrl-s)
if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

cd $HOME
