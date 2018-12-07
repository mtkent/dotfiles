#autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#colors
#export PS1="[$(tput bold)\]\[$(tput setaf 7)\]\h\[$(tput setaf 4)\]-\[$(tput setaf 6)\]\t:\[$(tput setaf 7)\]\W\[$(tput setaf 5)\]\\$ \[$(tput sgr0)\]"

#export PS1="\w$ "
export PS1="\[\033[33m\]\w\[\033[00m\]$ "

alias mb="~/src/qm2/scripts/monobuild.sh"
alias mbs="mb -c setVersion"
alias mbb="mb -c build"
alias mbr="mb -c reset"
alias mbg="mb -c showDependencyGraph"

export PATH=~/bin/Sencha/Cmd/6.2.1.29:$PATH
export PATH=~/bin/Sencha/Cmd/6.5.1.240:$PATH

#########################
##### Basic Aliases #####
#########################
alias ls='ls $LS_OPTIONS'
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"
alias ld="ls -d"
#alias rm="rm -i"    # Make rming a slow and painful process
# Show most recent files at the bottom
alias ltr="ls -ltr"

# Why doesn't everyone have these?
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

# Always use extended regex
#alias grep="egrep"
alias cgrep="egrep --color=always"
# Grep with line numbers and colors
alias G="grep -n --color=always --binary-file=without-match --exclude=tags --exclude=*-min.js --exclude-dir='.[a-zA-Z]*' --exclude-dir='external' --exclude-dir='blib'"
# Add recursive & insensitive matching
alias GR="G -r"
alias GRI="G -r -i"
alias GIR="GRI"
alias IGR="GRI"
alias IRG="GRI"
# Ack is too hard to type
alias a="ack"
alias avg="ack --invert-file-match -G"
alias shead="sort|uniq -c|sort -rn|head"
alias t="tail -F"

# Find processes
alias paux="ps aux|grep -i"
# Get more math functions, no startup message
alias bc='bc -lq'
# See man pages from all sections
alias man="man -a"

# Is someone looking over your shoulder?
alias c="clear"
alias logout="clear; logout"

# Searching for packages - I added quotes around $OS_TYPE because it was giving me a warn about [
if [ "$OS_TYPE" = 'macos' ]; then
    # I use homebrew
    alias searchy="brew search"
elif [ "$OS_TYPE" = 'freebsd' ]; then
    alias searchy="whereis search"
elif [ "$OS_TYPE" = 'linux' ]; then
    # Let's just assume it's Debian for now
    alias searchy="apt-cache search"
fi

alias which='type -a'
alias h="history |grep"
# Info pages are crap. make them slightly less so.
alias info="info --vi-keys"
# Why doesn't BitchX load the rc by default?
alias BitchX="BitchX -b"
# Continue wget downloads if possible
alias wget="wget --no-check-certificate -c"
# Reset terminal escape code http://forums.gentoo.org/viewtopic-t-444558-start-0.html
alias nethack='echo -e "\033c"; nethack'
alias bcvissh="bcvi --wrap-ssh --"
alias screen='TERM=screen screen'
alias jobs="jobs -l"
alias bwm-ng="bwm-ng -u bytes -T avg -i getifaddrs"
alias svndiffvim='svn diff --diff-cmd ~/bin/svnvimdiff'
alias nslookup="nslookup -sil"
alias wgetdir="wget -r -nH --no-parent"
alias wgetmirror="wget -e robots=off --wait 1 --mirror -U Firefox/11.0 -p --adjust-extension --convert-links --no-parent"
# Print 2 columns, big header, landscape mode, code highlighting, color,
# and use arrows to mark wrapped lines
alias enscript='enscript -2Gr -E --color -C --mark-wrapped-lines=arrow'
alias perldoc='PAGER="" perldoc'
alias pd='perldoc'
alias urldecode='perl -pe '"'"'s/%([0-9a-f]{2})/sprintf("%s", pack("H2",$1))/eig'"'"
alias sharethisdir="echo 'now sharing cur directory at port 9000'; python -m SimpleHTTPServer 9000"
alias ytrip="youtube-dl --max-quality 22 --output '%(title)s.%(ext)s'"
alias chromedev="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
# Things I usually want
alias tcpdump="tcpdump -vvnX -s0"
alias mci="mvn clean install"
alias gcb="./gradlew clean build"
#alias gr="./gradlew"
alias gw="./gradlew"
alias rubocop="rubocop -DE"
alias kb="./kobaltw"

# Hide a bunch of crap in dig
alias dig='dig +nocomments +noquestion +nocmd +nostats'

alias gti='git'
alias gitl='git l -n3'
alias gits='git st'
alias g='git st'
alias ga='git add -p'
alias gitd='git diff'
alias gitr='git r'
alias gitf='git f'
alias gitb='git branch'
alias yoink='git stash && git pull && git stash pop'
alias yolo='git push -f'
alias gsrebase='git-svn-rebase'
alias prune="git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print \$1}' | xargs git branch -d"
alias gmd="git fetch origin develop:develop"

#don't need?
alias gh='hg'
alias hgl='hg lnp -l3'
alias hgs='hg st'
alias hgd='hg diff'

alias routes='netstat -nr -f inet'

# Docker
alias docker-stop='docker stop $(docker ps|tail -1|fawk NF)'
alias docker-bash='docker exec -t -i $(docker ps|tail -1|fawk NF) /bin/bash'
alias docker-big-hammer='docker rmi -f $(docker images -q)'
alias dps='docker ps --format "table {{.ID}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'
alias d='docker'
alias docker-login='eval $(aws ecr get-login --registry-ids=736692106039 --no-include-email)'
alias docker-kill='docker ps -q | xargs docker rm -f'
alias docker-biggest-hammer='docker-kill && docker system prune && docker rmi -f $(docker images -q)'
alias docker-eval='eval $(docker-machine env default)'
alias dports="docker ps --format \"{{.Ports}}: {{.Names}}\""

#####################
##### Compiling #####
#####################
alias gcc='cowsay "gcc"; gcc'
alias g++='cowsay "g++"; g++'
alias make='cowsay "make"; nice -n 10 make'
alias javac='cowsay "javac"; javac'
# Java with remote debugging enabled
alias jdebug='java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005'

alias awsmarinatest='aws ecs list-services --cluster ecscluster-staging --profile ecs-describe | grep marina'

##### Clearspring #####
# Completion for cssh (see ~/bin/cssh)
complete -F _ssh cssh

source /Users/marinakent/src/startup_scripts/check_docker_machine_ip.sh
docker-eval

alias grdp='grd publishToMavenLocal'
alias grd='gr -DuseMonobuildArtifact=true'

alias dabman-error="curl -o - https://databricksmanager-production.internal.quanticmind.com/metrics/errored | jq '.metrics.jobs.error |= sort_by(.created)'"

# Gradle find
function gr() {
    REPOSITORY_ROOT="basename $(git rev-parse --show-toplevel)"
    PREVIOUS_DIR=$PWD
    PROJECT_NAME=""

    while [[ $PWD != / ]]; do
        if [[ -x "gradlew" ]]; then
            NEW_ARGUMENTS=()
            for command in $@; do
                if [[ $command == -* ]]; then
                    NEW_ARGUMENTS+=" $command"
                else
                    NEW_ARGUMENTS+=" $PROJECT_NAME$command"
                fi
            done

            ( set -x; ./gradlew $NEW_ARGUMENTS )
            break
        fi

        if [[ $PWD == *$REPOSITORY_ROOT ]]; then
            echo "No gradlew found :-("
            break
        fi

        BASENAME="$(basename $PWD)"
        PROJECT_NAME="$BASENAME:$PROJECT_NAME"
        cd ..
    done

    cd $PREVIOUS_DIR
}
