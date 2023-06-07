#!/bin/bash
ln -fs `pwd`/yabairc $HOME/.yabairc
ln -fs `pwd`/skhdrc $HOME/.skhdrc

brew tap koekeishiya/formulae

brew install skhd
brew install --HEAD yabai

brew services start skhd
brew services start yabai

