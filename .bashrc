# source all files in ~/.bash
source ~/.bash/aliases.sh
source ~/.bash/completions.sh
source ~/.bash/paths.sh
source ~/.bash/config.sh

export HOST_SYMBOL="⚡︎"

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

if [ -s "/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh" ]; then
    source "/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ "$(uname)" == "Darwin" ]; then
    if [[ $(which brew) ]]; then
        [[ -s "$(brew --prefix nvm)/nvm.sh" ]] && source $(brew --prefix nvm)/nvm.sh
    fi
fi
