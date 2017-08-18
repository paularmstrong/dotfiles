# source all files in ~/.bash
source ~/.bash/aliases.sh
source ~/.bash/completions.sh
source ~/.bash/paths.sh
source ~/.bash/config.sh

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_reset=`tput sgr0`
    color_red=`tput setaf 1`
    color_green=`tput setaf 2`
    color_yellow=`tput setaf 3`
    color_blue=`tput setaf 4`
    color_magenta=`tput setaf 5`
    color_cyan=`tput setaf 6`
    text_bold=`tput bold`
else
    color_reset=
    color_red=
    color_green=
    color_yellow=
    color_blue=
    color_magenta=
    color_cyan=
    text_bold=
fi

HOST_SYMBOL="⚡︎"
HOST_COLOR=${color_yellow}

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

function _git_color() {
    local git_status="`git status -unormal 2>&1`"
    ansi=
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            ansi=$color_green
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            ansi=$color_cyan
        else
            ansi=$color_magenta
        fi
    fi
    echo "${ansi}"
}

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch="`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`"
        fi
        echo -ne " ${branch}"
    fi
}

source "/opt/twitter/opt/git/etc/bash_completion.d/git-prompt.sh"
export PS1="[\h \[\033[0;36m\]\W\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$"
# export PS1="\W\[\$(_git_color)\]\$(_git_prompt)\[${text_bold}${HOST_COLOR}\] ${HOST_SYMBOL} \[${color_reset}\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ "$(uname)" == "Darwin" ]; then
    if [[ $(which brew) ]]; then
        [[ -s "$(brew --prefix nvm)/nvm.sh" ]] && source $(brew --prefix nvm)/nvm.sh
    fi
fi
