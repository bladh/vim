#!/bin/sh

[ -f $HOME/.vimrc ] || ln -s $(readlink -f vimrc) $HOME/.vimrc
