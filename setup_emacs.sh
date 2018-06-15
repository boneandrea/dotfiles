#!/bin/sh

set -eux

TARGET=~/.emacs.d

mkdir -p $TARGET
DIR=`pwd`
FILES="Cask init.el"

for f in $FILES ; do
  ln -s $DIR/.emacs.d/$f ~/.emacs.d/$f
done

cd $TARGET
cask install

