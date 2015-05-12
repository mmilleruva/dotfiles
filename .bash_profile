
ulimit -n 1000
alias nt="nvm_use 0.10"
alias sd="cd ~/scm/sd"
alias personal="cd ~/scm/personal"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH:~/bin"
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

#Add color to terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Docker variables
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/michaelmiller/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
