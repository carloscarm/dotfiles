#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function doIt() {
    if [ "$(uname)" == "Darwin" ]; then
	rsync --exclude ".git/" \
              --exclude ".gitattributes" \
              --exclude ".gitignore" \
	      --exclude ".DS_Store" \
	      --exclude ".osx" \
	      --exclude "bootstrap.sh" \
	      --exclude "README.md" \
	      --exclude "LICENSE-MIT.txt" \
	      --exclude "bin" \
	      --exclude "init" \
	      --exclude "brew.sh" \
	      --exclude "make_bkup.sh" \
	      --exclude "check_diffs.sh" \
	      -avh --no-perms . ~;
    else
	rsync --exclude ".git/" \
              --exclude ".gitattributes" \
              --exclude ".gitignore" \
	      --exclude ".DS_Store" \
	      --exclude ".osx" \
	      --exclude "bootstrap.sh" \
	      --exclude "README.md" \
	      --exclude "LICENSE-MIT.txt" \
	      --exclude ".macos" \
	      --exclude ".mac_functions" \
	      --exclude ".mac_aliases" \
	      --exclude "bin" \
	      --exclude "init" \
	      --exclude "brew.sh" \
	      --exclude "make_bkup.sh" \
	      --exclude "check_diffs.sh" \
	      -avh --no-perms . ~;
    fi
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt;
    fi;
fi;
unset doIt;
