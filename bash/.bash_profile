GIT_BRANCH_COLOR="\[\033[0;90m\]"
PATH_COLOR="\[\033[0;33m\]"
NORMAL="\[\033[0m\]"

GIT_PS1_SHOWDIRTYSTATE=true

# Increase the number of open files in OS X
# http://krypted.com/mac-os-x/maximum-files-in-mac-os-x/XS
# ulimit -n 512

eval "$(/opt/homebrew/bin/brew shellenv)"
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

hash javac 2>/dev/null && export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
hash go 2>/dev/null && export GOPATH=$HOME/Development/Go

export NLS_LANG="AMERICAN_AMERICA.UTF8"
export GIT_BRANCH_NAME_MAX_LENGTH=100
export PS1="\u:${PATH_COLOR}\W${NORMAL}\$(__git_ps1 \" [${GIT_BRANCH_COLOR}%0.${GIT_BRANCH_NAME_MAX_LENGTH}s${NORMAL}]\")\$ "
export ALTERNATE_EDITOR=""
hash emacsclient 2>/dev/null && export EDITOR="emacsclient -t"
export TERM=xterm-256color
export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH:$GOPATH/bin:$HOME/.cargo/bin
export BASH_SILENCE_DEPRECATION_WARNING=1

alias e="$EDITOR"
alias emacs="emacs -nw"

# Use colordiff instead of diff if installed. To install colordiff run:
#   brew install colordiff
if command -v colordiff 2>&1 >/dev/null; then
  alias diff="colordiff"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.bashrc" ]] && source ~/.bashrc
[[ -s "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"

###############################################
### gocd -- navigate Go packages in $GOPATH ###
###############################################

function gocd() {
  cd "$GOPATH/src/$1"
}

function __gocd_complete() {
  COMPREPLY=()

  local cur="${COMP_WORDS[COMP_CWORD]}"

  COMPREPLY=( $(for pkg in $( echo "${GOPATH[@]}/src/$cur*/" ); do echo ${pkg#$GOPATH/src/}; done) )

  return 0
}

complete -o nospace -F __gocd_complete gocd

### End of gocd ###

######################################################
### Complete ssh host from .ssh/known_hosts on TAB ###
######################################################

function __ssh_complete()
{
  COMPREPLY=()

  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$cur" =~ "@" ]]; then
    local user=${cur%%@*}
    local prefix="@"
  fi

  local opts=$(awk '{split($1,hosts,","); for (i in hosts) {if (hosts[i] !~ /[0-9]+(\.[0-9]+){3}/) print hosts[i]}}' "$HOME/.ssh/known_hosts" | sort | uniq)

  COMPREPLY=( $(compgen -W "${opts}" -P "${prefix}" -- "${cur#*@}") )

  return 0
}

complete -o nospace -F __ssh_complete ssh
complete -o nospace -F __ssh_complete scp

### End of ssh completion ###

###############################################
###           git command aliases           ###
###############################################
alias glm="git log $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@').."
alias gs="git status"
alias gl1="git log -1 --stat"
