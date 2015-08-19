GIT_BRANCH_COLOR="\[\033[0;90m\]"
PATH_COLOR="\[\033[0;33m\]"
NORMAL="\[\033[0m\]"

GIT_PS1_SHOWDIRTYSTATE=true

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
source "$HOME/.fzf.bash"

export JAVA_HOME="$(/usr/libexec/java_home)"
export GOPATH=$HOME/Development/Go

export NLS_LANG="AMERICAN_AMERICA.UTF8"
export GIT_BRANCH_NAME_MAX_LENGTH=100
export PS1="\u:${PATH_COLOR}\W${NORMAL}\$(__git_ps1 \" [${GIT_BRANCH_COLOR}%0.${GIT_BRANCH_NAME_MAX_LENGTH}s${NORMAL}]\")\$ "
export EDITOR="emacsclient -t"
export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH:$GOPATH/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.bashrc" ]] && source ~/.bashrc
