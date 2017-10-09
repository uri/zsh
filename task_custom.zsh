#!/bin/zsh

function tt {
  CMD="add "

  if [ -n "$TPROJECT" ]; then
    CMD="$CMD project:$TPROJECT "
  fi
  if [ -n "$TTAGS" ]; then
    CMD="$CMD tags:$TTAGS "
  fi
  if [ -n "$TDUE" ]; then
    CMD="$CMD due:$TDUE "
  fi

  eval "task $CMD $@"
}
