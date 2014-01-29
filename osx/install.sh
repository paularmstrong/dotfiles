#!/bin/bash

NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
ERROR_COLOR=\x1b[31;01m
WARN_COLOR=\x1b[33;01m

if [[ ! $(which brew) ]]; then
    echo "${WARN_COLOR}"
    echo "----------------------------------------"
    echo "Homebrew not found. Installing..."
    echo "----------------------------------------"
    echo "${NO_COLOR}"
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

if [[ ! $(which node) ]]; then
    echo "${WARN_COLOR}"
    echo "----------------------------------------"
    echo "Node.js not found. Installing..."
    echo "----------------------------------------"
    echo "${NO_COLOR}"
    brew install node
fi

if [[ ! $(which rvm) ]]; then
    echo "${WARN_COLOR}"
    echo "----------------------------------------"
    echo "RVM not found. Installing..."
    echo "----------------------------------------"
    echo "${NO_COLOR}"
    \curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3
fi

echo "${WARN_COLOR}"
echo "----------------------------------------"
echo "Updating Homebrew..."
echo "----------------------------------------"
echo "${NO_COLOR}"
brew update

brew tap phinze/homebrew-cask
brew install brew-cask
brew upgrade brew-cask

read -p "Do you want to Install Applications? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "${WARN_COLOR}"
    echo "----------------------------------------"
    echo "Installing Applications..."
    echo "----------------------------------------"
    echo "${NO_COLOR}"
    brew cask install adium
    brew cask install alfred
    brew cask install dropbox
    brew cask install fluid
    brew cask install f-lux
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install macfusion
    brew cask install skype
    brew cask install totalfinder
    brew cask install transmit
    brew cask install virtualbox
    brew cask install vagrant
    brew cask install vlc
fi

echo "${OK_COLOR}"
echo "----------------------------------------"
echo "All dependencies installed"
echo "----------------------------------------"
echo "${NO_COLOR}"

read -p "Do you want to link prefs from Dropbox? (y/n) " -n 1
echo
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

echo "Now go download Sublime Text"
open "http://www.sublimetext.com/3"
