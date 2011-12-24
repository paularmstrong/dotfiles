# source all files in ~/.bash
source ~/.bash/aliases.sh
source ~/.bash/completions.sh
source ~/.bash/paths.sh
source ~/.bash/config.sh

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
