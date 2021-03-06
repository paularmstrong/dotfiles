# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# List all files colorized in long format, including dot files
alias la="ls -Gla"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias ls="command ls -G"
else
    alias ls="command ls --color"
    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

function base64() {
    EXT=`echo "$1"|awk -F . '{print $NF}'`
    B64=`openssl base64 -in $1 | tr -d '\n'`
    echo "data:image/$EXT;base64,$B64" | pbcopy
}


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Start an HTTP server from a directory
alias server="open http://localhost:9999/ && python -m SimpleHTTPServer 9999"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Copy my public key
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Launch a vagrant VM
alias vag="vagrant up && vagrant ssh"

# Make a directory and immediately jump into it
function mkd() {
    mkdir $1 && cd $1
}

# easy HTTP requests
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -m '$method'"; done

# quit OS X applications cleanly
function quit() {
    osascript -e "tell application \"$1\" to quit"
}

# Extract based upon file ext
function ex() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via >extract<" ;;
        esac
      else
        echo "'$1' is not a valid file"
    fi
}

# Make a goo.gl short URL
function shorturl() {
    url=$(curl -s https://www.googleapis.com/urlshortener/v1/url -H "Content-Type: application/json" -d "{\"longUrl\": \"$1\"}" | awk 'BEGIN { FS = "id\": \"" }; { print $2}' | tr -d '\",' | tr -d '\n')
    echo $url | pbcopy
    echo $url
}

# Completely remove the current branch from a git repo
function rm-branch() {
    branch="$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    git checkout master
    git branch -D $branch
}

function t() {
    tree -I '.git|node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}
