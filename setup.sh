#!/bin/sh
CURR_DIR=`pwd`

for custom_file in $(ls -1 *.zsh); do
  ln -sf "$CURR_DIR/$custom_file" ~/.oh-my-zsh/custom/$custom_file
done

