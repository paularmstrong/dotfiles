#!/bin/bash

echo "Checking Dependencies..."

if [[ ! $(which brew) ]]; then
    tput setaf 3
    echo "----------------------------------------"
    echo "Homebrew not found. Installing..."
    echo "----------------------------------------"
    tput sgr0
    ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"
fi

if [[ ! $(which node) ]]; then
    tput setaf 3
    echo "----------------------------------------"
    echo "Node.js not found. Installing..."
    echo "----------------------------------------"
    tput sgr0
    brew install node
fi

if [[ ! $(which npm) ]]; then
    tput setaf 3
    echo "----------------------------------------"
    echo "NPM not found. Installing..."
    echo "----------------------------------------"
    tput sgr0
    curl http://npmjs.org/install.sh | sh
fi

echo
