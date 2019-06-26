function pcg {
  pass -c gpg/urigorelik > /dev/null
  echo a | gpg -q -u uri -r uri -e | gpg -q -d > /dev/null
  eval "$@"
}
