#!/bin/bash

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Do you want to update your git config? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        TEMP="temp.gitconfig"
        read -p "Enter your name: "
        sed -e "s/<git.name>/$REPLY/g" .gitconfig > $TEMP && mv $TEMP .gitconfig
        read -p "Enter your email address: "
        sed -e "s/<git.email>/$REPLY/g" .gitconfig > $TEMP && mv $TEMP .gitconfig
        read -p "Enter your github username: "
        sed -e "s/<github.user>/$REPLY/g" .gitconfig > $TEMP && mv $TEMP .gitconfig
        read -p "Enter your github token: "
        sed -e "s/<github.token>/$REPLY/g" .gitconfig > $TEMP && mv $TEMP .gitconfig
        echo
    else
        rm .gitconfig
    fi
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "scripts/" --exclude "osx/" --exclude "Makefile" --exclude "README.md" -av . ~/.
    source "$HOME/.bash_profile"
    git checkout .gitconfig
else
echo "NOOOOOOOOOOOO!"
fi
