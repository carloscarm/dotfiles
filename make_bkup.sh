#!/bin/bash

BKUP=$HOME/.backups/`date +%F_%R:%S`
mkdir -p $BKUP

for f in .??*; do
	#echo $HOME/$f;
	[ -f $HOME/$f ] && [ -r $HOME/$f ] && echo $HOME/$f && cp -a $HOME/$f $BKUP;
done
