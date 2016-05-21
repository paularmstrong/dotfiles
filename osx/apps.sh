#!/bin/bash

NO_COLOR=$(tput sgr0)
OK_COLOR=$(tput setaf 2)
ERROR_COLOR=$(tput setaf 1)
WARN_COLOR=$(tput setaf 3)

if [[ ! $(which brew) ]]; then
    sh ./homebrew.sh
fi

function brew_install() {
    if [[ $(brew ls --versions $1 | grep -q "^$1 ") ]]; then
        tput setaf 1
        echo "$1 not found. Installing..."
        tput sgr0
        brew install $1
    fi
    tput setaf 2
    echo -n "✔︎"
    tput sgr0
    echo " $1"
}

brew_install "caskroom/cask/brew-cask"
brew tap caskroom/versions

read -p "Do you want to Install OS X Applications? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "${WARN_COLOR}"
    echo "----------------------------------------"
    echo "Installing Applications..."
    echo "----------------------------------------"
    echo "${NO_COLOR}"
    brew cask install alfred
    brew cask install dropbox
    brew cask install fluid
    brew cask install flux
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install lastfm
    brew cask install moom
    brew cask install skype
    brew cask install sublime-text3
    brew cask install transmit
    brew cask install virtualbox
    brew cask install vagrant
    brew cask install vlc
fi
