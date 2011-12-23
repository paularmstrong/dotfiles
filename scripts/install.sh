#!/bin/bash

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "scripts/" --exclude "osx/" --exclude "Makefile" --exclude "README.md" -av . ~/.
  	source "$HOME/.bash_profile"
else
echo "NOOOOOOOOOOOO!"
fi
