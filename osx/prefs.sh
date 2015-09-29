#!/bin/bash

read -p "Do you want to link prefs from Dropbox? (y/n) " -n 1
echo " "
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for file in ~/Dropbox/Library/Application\ Support/*
    do
        ln -s "$file" ~/Library/Application\ Support/
    done
    for file in ~/Dropbox/Library/Preferences/*
    do
        ln -s "$file" ~/Library/Preferences/
    done
    ln -s ~/Dropbox/Library/Safari ~/Library/Safari
    ln -s ~/Dropbox/Library/Sublime\ Text\ 3 ~/Library/Sublime\ Text\ 3
    ln -s ~/Dropbox/Library/Colors ~/Library/Colors
fi
