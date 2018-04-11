#!/bin/sh

set -eux

TARGET=~/.emacs.d

mkdir -p $TARGET
cp .emacs.d/Cask .emacs.d/init.el $TARGET

cd $TARGET
cask install

