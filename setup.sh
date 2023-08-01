#!/bin/sh
CURR_DIR=`pwd`
ZSH_CUSTOM="$HOME/.zsh-custom"
mkdir -p $ZSH_CUSTOM

ln -sf "$CURR_DIR/zshrc" ~/.zshrc
ln -sf "$CURR_DIR/ripgreprc" ~/.ripgreprc
ln -sf "$CURR_DIR/fzf_custom.zsh" ~/.fzf_custom.zsh
ln -sf "$CURR_DIR/task-git-sync" ~/bin/
ln -sf "$CURR_DIR/tw" ~/bin/
ln -sf "$CURR_DIR/secrets.ejson" ~/.secrets.ejson

for custom_file in $(ls -1 *.zsh); do
  ln -sf "$CURR_DIR/$custom_file" "$ZSH_CUSTOM/$custom_file"
done

# plugins

function install_plugins() {
  # rm -rf $ZSH_CUSTOM/themes/spaceship-prompt
  # git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
  # ln -fs $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme

  # autosuggestion
  local auto_suggestion_path="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
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
