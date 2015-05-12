export EDITOR=vi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

export PS1='\w$(__git_ps1 " (%s)")\$ '

# Virtualenvwrapper
export WORKON_HOME=$HOME/env
export PROJECT_HOME=$HOME/scm  # Or wherever your source root is
source /usr/local/bin/virtualenvwrapper.sh


export PYTHONPATH=":${PYTHONPATH}"



# Store original PS1
ORIG_PS1=$PS1

rvm_ps1 () {
    export PS1="(rvm \[\e[1;31m\]\$(rvm-prompt v g s)\[\e[m\]) ${ORIG_PS1}"
}

# Add rvm terminal prompt.

# Issue rvm use command and change terminal prompt.
rvm_use () { rvm use $@ && rvm_ps1; }


# NVM
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

export PATH="${PATH}:./node_modules/.bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/flex_sdk_4.6/bin"


# copy a new PR checklist to the working directory
new_pr () {
    cp ~/Documents/Checklists/PR_Checklist.todo ./

    # Check if we are in fluencia
    cur_path=${PWD##*/}

    if [[ "$cur_path" -eq "fluencia" ]]; then
      grunt coffee && grunt jade && grunt less
    fi
}

