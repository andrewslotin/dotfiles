# Setup fzf
# ---------
unalias fzf 2> /dev/null
unset fzf 2> /dev/null
if [[ ! "$PATH" =~ "/Users/suddendef/.fzf/bin" ]]; then
  export PATH="/Users/suddendef/.fzf/bin:$PATH"
fi

# Auto-completion
# ---------------
# [[ $- =~ i ]] && source "/Users/suddendef/.fzf/fzf-completion.bash"

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-sb} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}
