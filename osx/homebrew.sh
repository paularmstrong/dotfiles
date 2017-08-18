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

echo "${WARN_COLOR}"
echo "----------------------------------------"
echo "Updating Homebrew..."
echo "----------------------------------------"
echo "${NO_COLOR}"
brew update

#brew_install "node"
#brew_install "nvm"
#brew_install "python"
brew_install "git-extras"
#brew_install "ansible"
