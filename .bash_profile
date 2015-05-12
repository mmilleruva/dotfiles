export EDITOR=vi

# Path Setup
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:~/bin"
export PATH="${PATH}:./node_modules/.bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/flex_sdk_4.6/bin"

export PYTHONPATH=":${PYTHONPATH}"

# Install git auto-completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

ulimit -n 1000
alias nt="nvm_use 0.10"
alias sd="cd ~/scm/sd"
alias personal="cd ~/scm/personal"

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

#Add color to terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Docker variables
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/michaelmiller/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
