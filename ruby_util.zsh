function zeus-binstubs () {
  local shebang='#!/bin/sh'

  # Stub rspec
  echo $shebang > bin/rspec
  echo 'zeus test $@' >> bin/rspec

  # Stub rails
  echo $shebang > bin/rails
  echo 'zeus $@' >> bin/rails
}

function zeus-revert-binstubs() {
  git checkout bin/rails
  git checkout bin/rspec
}
