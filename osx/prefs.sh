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
    rm -rf /Library/Safari
    rm -rf /Library/Colors
    ln -s ~/Dropbox/Library/Safari ~/Library
    ln -s ~/Dropbox/Library/Colors ~/Library
fi
