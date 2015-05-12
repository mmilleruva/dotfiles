

export PS1='\w$(__git_ps1 " (%s)")\$ '

# Virtualenvwrapper
export WORKON_HOME=$HOME/env
export PROJECT_HOME=$HOME/scm  # Or wherever your source root is
source /usr/local/bin/virtualenvwrapper.sh

# Store original PS1
ORIG_PS1=$PS1

##############
# RVM Setup
##############
rvm_ps1 () {
    export PS1="(rvm \[\e[1;31m\]\$(rvm-prompt v g s)\[\e[m\]) ${ORIG_PS1}"
}

# Issue rvm use command and change terminal prompt.
rvm_use () { rvm use $@ && rvm_ps1; }

##############
# NVM
##############
nvm_ps1 () {
    # Set $VERSION, then do ANSI colors:
    export VERSION=`nvm_version`
    export PS1="(nvm \[$(tput setaf 4)\]$VERSION\[$(tput sgr0)\]) ${ORIG_PS1}"
}

nvm_use () {
    VERS=${1:-''}
    source ~/.nvm/nvm.sh
    if [ ${VERS} ]; then
        nvm use ${VERS}
        nvm_ps1
    else
        echo "Choose a version:"
        nvm ls
    fi
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

nvm_quit () {
    nvm deactivate
    nvm_ps1
}

#########################
# Repo Specific commands
#########################

alias flu="nt && cd ~/scm/sd/fluencia"
alias neo="nt&& cd ~/scm/sd/neodarwin"

ops () {
    rvm_use 2.1.2@ops
    cd ~/scm/sd/ops/chef
}

fluj(){
    rvm_use 2.1.2@fluencia-jekyll
    cd ~/scm/sd/fluencia-jekyll
    echo "start server: jekyll serve --config _configDev.yml"
}
