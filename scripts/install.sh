#!/bin/bash

TEMP="temp.gitconfig"

while test $# -gt 0; do
    case "$1" in
        --name*)
            NAME=`echo $1 | sed -e 's/^[^=]*=//g'`
            sed -e "s/<git.name>/$NAME/g" .gitconfig > $TEMP && mv $TEMP .gitconfig
            shift
            ;;
        --email*)
            EMAIL=`echo $1 | sed -e 's/^[^=]*=//g'`
            sed -e "s/<git.email>/$EMAIL/g" .gitconfig > $TEMP && mv $TEMP .gitconfig
            shift
            ;;
        *)
            break
            ;;
    esac
done

sudo pip install powerline-status -q
sudo gem install tmuxinator --user-install &>/dev/null

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "scripts/" --exclude "osx/" --exclude "Makefile" --exclude "README.md" -av . ~/.
source "$HOME/.bash_profile"
git checkout .gitconfig
