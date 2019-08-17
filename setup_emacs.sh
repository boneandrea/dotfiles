#!/bin/sh

set -ux

TARGET=~/.emacs.d

mkdir -p $TARGET
DIR=`pwd`
FILES="init.el inits local-lisp"

for f in `ls ./.emacs.d` ; do
  rm -rf ~/.emacs.d/$f
  ln -s $DIR/.emacs.d/$f ~/.emacs.d/$f
done

