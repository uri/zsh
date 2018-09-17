#!/bin/sh
CURR_DIR=`pwd`

ln -sf "$CURR_DIR/zshrc" ~/.zshrc
ln -sf "$CURR_DIR/ripgreprc" ~/.ripgreprc
ln -sf "$CURR_DIR/task-git-sync" ~/bin/
ln -sf "$CURR_DIR/tw" ~/bin/

for custom_file in $(ls -1 *.zsh); do
  ln -sf "$CURR_DIR/$custom_file" ~/.oh-my-zsh/custom/$custom_file
done

# plugins

function install_plugins() {
  npm install -g spaceship-prompt

  # autosuggestion
  local auto_suggestion_path="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  if [ ! -d $auto_suggestion_path ]
  then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
      $auto_suggestion_path
  else
    (cd $auto_suggestion_path &&
      git pull origin master)
  fi
}

install_plugins
