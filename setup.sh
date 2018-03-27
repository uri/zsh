#!/bin/sh
CURR_DIR=`pwd`

ln -sf "$CURR_DIR/zshrc" ~/.zshrc
ln -sf "$CURR_DIR/ripgreprc" ~/.ripgreprc

for custom_file in $(ls -1 *.zsh); do
  ln -sf "$CURR_DIR/$custom_file" ~/.oh-my-zsh/custom/$custom_file
done

npm install -g spaceship-promt
