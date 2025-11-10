#!/bin/sh

# This script runs mocha with node debug arguments.
# Based on the contents of the following files, the test-run will be scoped
# differently.
# - file.runtest: contents are the file filenames sepaparated by a newline that
#                 should be ran.
# - test.runtest: contents are a string that the test should filter by. Ex. you
#                 can copy the name of a `it` block and then only tests matching
#                 the provided string will run.
#
# This script also behaves differently if the DEBUG env is set.
# If set, a chrome window will be opened with devtools.
#
# Useful envs
#
# PINO_LOG_LEVEL: for projects that use it. Setting it to 'error' can help
#                   expose some more details about why a particular test is
#                   failing.
#
# Known issues:
#
# If there is no Chrome window already open to chrome://inpsect the subsequent
# window cannot open the URL. The sequence to getting things working:
# 
# 1. --inspect-brk (not just --inspect) must be used to pause the debugger.
# 2. Open chrome://inspect
# 3. Click the link to open the devtools window.
# 4. Minimize the chrome://inspect window
#
# Now --inspect can be used and a new window will automatically be created with
# devtools opened. If the parent chrome://inspect window is closed the
# open_devtools.sh script will not be able to open the window.

set -e

# export PINO_LOG_LEVEL=error
export PINO_LOG_LEVEL=fatal

ctest="$(cat test.runtest)"

if [ "$1" = "watch" ]; then
	fd . test src -e ts | entr -c yarn mocha ${ctest:+--grep "$ctest"} /_
	exit 0
fi


if [ "$DEBUG" = "init" ]
then
  DEBUG="--inspect-brk --timeout 900000"
elif [ -n "$DEBUG" ]
then
  DEBUG="--inspect --timeout 900000"
fi

ftest="$(cat file.runtest)"

set -x
# ${DEBUG:+open_devtools.sh} npx mocha ${DEBUG} ${ctest:+--grep "$ctest"} $ftest $args
npx mocha ${DEBUG} ${ctest:+--grep "$ctest"} $ftest $args
