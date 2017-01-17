#!/bin/bash

BKUP=$HOME/.backups/`date +%x-%X`
mkdir -p $BKUP

for f in .??*; do
	echo $HOME/$f;
	[ -f $HOME/$f ] && [ -r $HOME/$f ] && cp -a $HOME/$f $BKUP;
done
