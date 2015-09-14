#!/bin/bash

NO_COLOR=$(tput sgr0)
OK_COLOR=$(tput setaf 2)
ERROR_COLOR=$(tput setaf 1)
WARN_COLOR=$(tput setaf 3)

if [[ ! $(which brew) ]]; then
    echo "${WARN_COLOR}"
    echo "----------------------------------------"
    echo "Homebrew not found. Installing..."
    echo "----------------------------------------"
    echo "${NO_COLOR}"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

function brew_install() {
    if [[ ! $(brew ls --versions "$1" | grep -q "^$1 ") ]]; then
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

brew_install "node"
brew_install "nvm"
brew_install "python"
brew_install "git-extras"
brew_install "ansible"
brew_install "caskroom/cask/brew-cask"

sudo pip install powerline-status -q
sudo gem install tmuxinator --user-install &>/dev/null

read -p "Do you want to Install OS X Applications? (y/n) " -n 1
echo ""
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

read -p "Do you want to download Sublime Text? (y/n) " -n 1
echo " "
if [[ $REPLY =~ ^[Yy]$ ]]; then
    open "http://www.sublimetext.com/3"
fi

echo "${OK_COLOR}"
echo "----------------------------------------"
echo "Done"
echo "----------------------------------------"
echo "${NO_COLOR}"
