function pcg {
  pass -c gpg/urigorelik > /dev/null
  echo a | gpg -q -u uri -r uri -e | gpg -q -d > /dev/null
  eval "$@"
}

function current-branch() {
  git branch | grep \* | sed 's/\* //'
}
alias gcb=current-branch

