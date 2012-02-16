# source all files in ~/.bash
source ~/.bash/aliases.sh
source ~/.bash/completions.sh
source ~/.bash/paths.sh
source ~/.bash/config.sh

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=2
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=6
        else
            local ansi=5
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch="`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`"
        fi
        echo " $(tput setaf $ansi)$branch$(tput sgr0)"
    fi
}

export PS1="\W\$(_git_prompt)\[$(tput bold)$(tput setaf 3)\] ⚡ \[$(tput sgr0)\]"

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
